Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63D6C2BD09
	for <linux-i3c@archiver.kernel.org>; Mon,  1 Jul 2024 03:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DmZexLPn0A7wun/TsbpjpQumgdDlu1vaPGIzpTMszwQ=; b=1dsbc4eZCq/7Nv
	HqKOoTOtK4yNxYJi14ZIrr8RKQ8cAbcBIO55B3kvthrqA+cW4OXNph1viz+/RI0ylVBSxaSXACjtE
	S/h6y3dA407OTzImrokRbPTxUQ4/Q/Tg/C/gMf2TzRn56yGzu9KoGD2zCq1ozU2CDFHv8SLm99/so
	Nm5KZt9XZzC/okqPcSAs+Y99wCtrlky9LsiEIo6Hc9DsZG8UWZrConEyE+Lddy3eaQu9NSvnyTzGL
	amPBglh9MJP04vfw1m04jLkatiPlvHMSdtJq3pa3nTsqTBFZSzgSXHZ8NvnmQl/02WCWmTjaUAcCm
	i2fCbQKq2QdSqNzMG4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO7tn-00000001aYL-15tR;
	Mon, 01 Jul 2024 03:40:15 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sO7tk-00000001aWU-2Fbm
	for linux-i3c@lists.infradead.org;
	Mon, 01 Jul 2024 03:40:14 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-44664ad946eso188551cf.1
        for <linux-i3c@lists.infradead.org>; Sun, 30 Jun 2024 20:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719805210; x=1720410010; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lcRJAEmHTQJ6raULC6gkbkqnZMKGOXISaRkYXI5/DIY=;
        b=o5BghW4qfj9qwJP+ZX88VCc7JnyV3KgfrnhHgUyF1/hRy81PuKS4k22F+Iz8AdB9ib
         C395KNZsVc9wvaJSh5p2KDy6zozACa9JZTmZB575mfjZK5y5KTIfFAPdNaoLDNGCWXhp
         jGS2J+EFQcihNoxjsqxQei65or8U/MAUZ8Ydn7yTQ8WlaJDqZ3zDsNRxLR7EMEWiHozf
         eqa+g23ooe6pIsGv1banyYm1PaUOZ7RISNoekbQRtEalwx6f9c3jA8xLy/5X3fxMKahA
         KCV/1mBkJ5cpi+djT/hsAkkwZ8gQWRVGx0KCB3TgQaAc9Ydoju7aj/Sfd1nGQVln6K92
         jsVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719805210; x=1720410010;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcRJAEmHTQJ6raULC6gkbkqnZMKGOXISaRkYXI5/DIY=;
        b=vmekEGYfwd5v9qnaTPgWlkPg769bL//z6XfqvbnSwncc5LiMwKCiu7THFut9Pn0OVC
         i2GiWleiDqU3OdagXyWW+mVwcAQp7KD/EGkQ1kzrdEALEvgMdgnteem5T7UHLCrCvoNg
         EpqVkCF7R2da+sVyt/VICRTO9N2Tc87TLg+i6dQ182axm8fJvxxLl3gfe2gJkWfSUiLd
         5V8kttJhomSQF9VBWm8dQOBelc1Rj1nSMPwZP7l+GdSl3BJysY4lycs5c8dO58uqsB3W
         1YbFZIXALwG5eHcOA8yaivJtU19dg/J7vK6iCJxLK+wNzy79Umdree4yL8BrRmy4oEa+
         pUOw==
X-Forwarded-Encrypted: i=1; AJvYcCU/PNVElvGOa3sAX7MFZlNTvzTiT1fo45fzaT50JJNMqz1E4SDfGtgAbdKxNh75wFis6E1u1SsS5Iw7e2Fy34+PhiympDgkDQkOuQA1wg==
X-Gm-Message-State: AOJu0YzVlhF9uuANQAAPNkUQbBU6y6Xgj2mK4/fn52vfe0/PfJMRnJG5
	Mu/NRHGKc5xdSIV85yD9H1ud+LIF7XthWW3idnsdvAiED9i9qY/WC34ZvfS9B27v2lFHaqgdAR+
	Qa5RLKWi6zOPhMAPLctQouAuz0OV0GCBCWCq0
X-Google-Smtp-Source: AGHT+IHdqkjQn9wPvPDw2Eh/C0MehaQtK4v8qewVtwVVFGvFbeAIg0yq+VHAXtoLYIIkFDimpkKVCEnjTshfzCW67ZQ=
X-Received: by 2002:a05:622a:130a:b0:446:5864:f789 with SMTP id
 d75a77b69052e-4465df5271fmr4182161cf.17.1719805209738; Sun, 30 Jun 2024
 20:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240624052851.1030799-1-aniketmaurya@google.com>
 <20240628154526.324068-1-aniketmaurya@google.com> <20240628-primp-recite-6bf752fc5257@spud>
In-Reply-To: <20240628-primp-recite-6bf752fc5257@spud>
From: "Aniket ." <aniketmaurya@google.com>
Date: Mon, 1 Jul 2024 09:09:58 +0530
Message-ID: <CAMmmMt0RM4Pc-SWRrKVX1NdVDdZMUgPy58qPVvZvuApJU9FkcQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: dw: Add apb clock binding
To: Conor Dooley <conor@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240630_204012_630064_FF7481FB 
X-CRM114-Status: UNSURE (   7.55  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

> Missing a review from Krzysztof:
> https://lore.kernel.org/all/e3160411-59e0-4806-a00d-b99564384180@linaro.org/
>
> Also, please do not send a new version of a series as a reply to a
> previous version. It'll bury it in people's mailboxes depending on how
> they sort.

Got it, will keep in mind next time.

Thanks,
Aniket

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
