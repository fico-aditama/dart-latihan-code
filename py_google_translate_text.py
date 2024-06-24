!pip install -q googletrans
!pip install -q deep-translator


from deep_translator import GoogleTranslator
to_translate = 'I want to translate this text'
translated = GoogleTranslator(source='auto', target='id').translate(to_translate)
translated


from deep_translator import GoogleTranslator

df_state['Name1'] = df_state['Name'].apply(lambda x:GoogleTranslator(source='auto', target='id').translate(x))
