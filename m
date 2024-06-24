Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A095C2BD05
	for <linux-i3c@archiver.kernel.org>; Mon, 24 Jun 2024 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qp1xfop7HtAG087F4T01+b9v88ECnG0PGbmKqLVGECo=; b=RrRSMGsJnUUSVS
	Ht+Ss38SAMZLTUwtj+h5GZ9Z9V5pVcGPAE8pXx39ZHHpYtOjazlmi/MKWP8MaKCFJbeQMeBaOua5e
	UCtQYQZvwsutBkeAOzktrHw/ABO/ZQyK0gt8CYu7lLp4amdE26tQ1BqaLenkk/N8933wHBO9qRMMu
	wa4kUvTNROCrhJhK4nBnrO8d6LGegpL8exyOBOHg55Cs28PoXiVEWjd1bFhPN1UifhV0ow+ofMSLS
	3cQDDGDLKJ5Ijbb5vstGboU3zYapvDBxTE6taSoTjbfbXNfl7tv7arroV3pr/X344P9vljqmbpJX+
	M1CvceCTh+TRkswnjF6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLfND-0000000G7J5-32Zn;
	Mon, 24 Jun 2024 08:48:27 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLfNC-0000000G7H6-00Yo
	for linux-i3c@lists.infradead.org;
	Mon, 24 Jun 2024 08:48:27 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4405dffca81so650811cf.1
        for <linux-i3c@lists.infradead.org>; Mon, 24 Jun 2024 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719218903; x=1719823703; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5tg8FQPxEAdgsMy5r6wK3+Fb55nIGfOe5i0pltcrAY8=;
        b=0g1A/5qvOO7STl+evFlYDNePeuR7YYYpWkQUbgQlvD7HK+yb9J6SPQtPW7FoK3YPJE
         Icm2zbdtrSCKssLPFmY8uwjPGrpO9u9qhNRvuD1m4JGre18C45dpqcb3BjjGS4WlQhtZ
         xD29hXsDnbkir3YdMx/HMynNiS38R1LC5u280okl9T0LKSR+p0OBx+Re5JA+cVaaCPgk
         sPHa00FWCGxqsY56US5JBXblUUxMkl5wnN+rgCBR9bekvvCsXVX8VcCr9W6dXs4ta3bb
         GPCYaOIQwcF3/0al6NUPyfoUIXl4pnBzyreE4570BtMtQSAm0xxw5gSpQbRsgeBjr+78
         SecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719218903; x=1719823703;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tg8FQPxEAdgsMy5r6wK3+Fb55nIGfOe5i0pltcrAY8=;
        b=YCcqt0cAmloeI+Tmd4TTLt5KJdDNr323jyeSzW+A0fGek9/Ds9UrYi4D2q3FrF8SQL
         yicB53QwHXTw+M89OAM2dzwATO/i3xiAyxE1qsmJPZ7iZzFYXTdK5tjESWvUIyJLdmXX
         D1BOXSvDbeHm/xUW8lMtYpnumRR+JhN8X3PMi9yScSBlpzifsZK5xqASWe3kblM5bniK
         FTEpqLo4mNplgBEbUKa3LvrYum7R8GMN58Olj2/ehiUlIJv/ai7Jo9O+Yk7Uk0VY9k1Y
         wYU8tPQck+ZxYHQpTLDGhvFYLp9/kbokRv/s7dEwt73zEKDqKmAtmGE+YsJo8CpXv04E
         Mcaw==
X-Forwarded-Encrypted: i=1; AJvYcCXWIxru7jKtuY7VrVB3KPOO1MTlkNwc+0HNo1EmYdzA0KGoPBYdI4uEBkYPZraE2BTIw8p2ZKaJ1iwjBaA5YZCvkWwweCcXnc1joRzNKA==
X-Gm-Message-State: AOJu0YyEVMsLP5Ky13hC/XKU/+2Y4e4Xr5CI+E9uC8WdlMbRf/0nriiS
	Q+3+uY5Pyf4hFTAmmxgnOb7+YGkM9t7W7e+NoGg8QsvkrjJr+JkQZERZuZveirRsCk9mg/DpKiH
	lUQ+fvI6tQVdY6mUzweAZzOuM3ypm3jcuYfLy
X-Google-Smtp-Source: AGHT+IHHH3rbfM8HbKt7NrhzLinrp/ljSBxeHNTlEVCPczmxbmT44rj90HeYiqkVOVpeugBhZL+gWJp1KQDIv56AB7A=
X-Received: by 2002:a05:622a:189f:b0:441:5aff:a5db with SMTP id
 d75a77b69052e-444ce38f060mr3807121cf.25.1719218903398; Mon, 24 Jun 2024
 01:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com>
 <20240624052851.1030799-1-aniketmaurya@google.com> <3c053c47-50ed-4487-a18f-4439d3f2e7f6@linaro.org>
In-Reply-To: <3c053c47-50ed-4487-a18f-4439d3f2e7f6@linaro.org>
From: "Aniket ." <aniketmaurya@google.com>
Date: Mon, 24 Jun 2024 14:18:12 +0530
Message-ID: <CAMmmMt03L7ymosG8CYaRPvKZWdXrnMxHNRQJxHMycs95c5ob0Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] i3c: dw: Add apb clk
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_014826_060356_30116A8F 
X-CRM114-Status: UNSURE (   6.10  )
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

> Where is the changelog?
Sorry, I missed the changelog.

Changes from v1 to v2
- extra example removed from yaml file, minor renaming.
- 3rd patch added to migrate to *_enabled clk_get APIs.

Thanks,
Aniket.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
