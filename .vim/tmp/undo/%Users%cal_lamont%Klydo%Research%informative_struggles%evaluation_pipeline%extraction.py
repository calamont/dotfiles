Vim�UnDo� �.lA!�	�f@2e�BQ����L��K�VT6   S   &        data["extraction"] = sentences   K                          ^��|    _�                     (       ����                                                                                                                                                                                                                                                                                                                                                             ^��|     �   '   )   S      :def extract_sentences(data, label, eldar=False, query=""):5�_�                          ����                                                                                                                                                                                                                                                                                                                                                             ^��     �         S      +def extract_reviews(data, label, query=""):5�_�                    #   	    ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   "   $   S          data[label] = reviews5�_�                    $   &    ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   #   %   S      -    data.drop_duplicates(subset=["id",label])5�_�                    8       ����                                                                                                                                                                                                                                                                                                                                                             ^��     �   7   9   S              data[label] = sentences5�_�                     K       ����                                                                                                                                                                                                                                                                                                                                                             ^��    �   J   L   S              data[label] = sentences5�_�                          ����                                                                                                                                                                                                                                                                                                                                                             ^��     �         S      #def extract_reviews(data,query=""):5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             ^��     �         S      #def extract_reviews(data,query=""):5��