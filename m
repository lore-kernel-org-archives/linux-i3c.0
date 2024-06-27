Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2113C3064D
	for <linux-i3c@archiver.kernel.org>; Thu, 27 Jun 2024 03:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wAJlwZ4by9SENw+JlJ8RuyuYKnz3UUOO/TdYPhOdi/o=; b=G4+m9BYNYia2LJ
	FlAXLcQMaFjhjob5Pp8Q/+UxYhDW8XZhrj4TNNCKOuPfvIfuYkVvVR2d8sqFxvg4utloy8A3xTlmC
	IBekrLICOd5tEIs2fcTpwbgmRfatpN13O9MIvWz+nx8kcTWln3rjiQWbeB/ivNnIBtLwgohXL5e/2
	f2JKGhbugXWc/wJ0D4Oy63DvmbVNgn56D6KV/Yiktog+r6/CsWrDs0iAwRTLW9Y1YzCoJUB/ktAVz
	6CmyUCG78QqbR3/Vy2z8bVUsXDMxewLpjUZRP414PcYcGzkQV3Ov7KfMScc95FsqOZc2hZOMiRDpU
	mB2QnenY489o9BoIYF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMfmA-000000096Dc-0NXP;
	Thu, 27 Jun 2024 03:26:22 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMfm6-000000096CC-2cGx
	for linux-i3c@lists.infradead.org;
	Thu, 27 Jun 2024 03:26:20 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4450111d54dso114151cf.0
        for <linux-i3c@lists.infradead.org>; Wed, 26 Jun 2024 20:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719458773; x=1720063573; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uvR+0Gq+x6k+bBQoe6kzaG9QWJVAkKlY2L6BoK1ipuc=;
        b=cxOMWDhuO9nhKjwPnfX6kEmeWdpy0W85ilSUwuraBwVN4JTXKtYPpihhzRvfRPCuJW
         2JRK11osXjP5ShfT+KiaDYmENJMdgcwQoZWCsJ9aIUlMFTgV8ROrUozLd1iRmcAYH71x
         1qRXFlOJ70oFgcb249l1MXsMrqBOzXTRxPPb2eXHMs7WNhu7oXLtH6TFptwX/DUQCfrD
         25SKPgByDB3BAEKSEgMRGeGAvZG3nixf+Et4BLSk6u9Zy9kvLqTwCq8Z8WRX7mB+koNt
         96N4PJbCWKuOV5S0vftvFRbLrtdjNSflGjPBgGgooYh2+pGUyVENsBKzxVmWS9a9DN78
         +1lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719458773; x=1720063573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvR+0Gq+x6k+bBQoe6kzaG9QWJVAkKlY2L6BoK1ipuc=;
        b=ah8PTsZUZ0V69p0x7qxC9+GcuU8c9yJoHyszdCDBJntqnQO0xnRfiL+g7f8yVWtRmH
         dMWiB48Pd7eSh9mmTaD62GXequwsddCv1hKbfIHU4flI10i/vSVLGrMoDbsyBf/iNVd2
         7p4F5J7t5i3Ix2+9gfATNKQnvK9MDcxfgJ85Ba4AItd5UKjn5j6O42vLjWkMXn3eyuRC
         zIiRPP8qrqdLzej+vUliFJWUaW4UX+RlXn+VE9aTgNsGw/mSJ+Khi9iK472HkN7dNMkF
         mBa4/xy0G8O2feUtPkAPhFZcLr4FN5/dP+Z0+aeH3zJX+6SPxAM4M5143DjA4fZ2h/Mk
         8Liw==
X-Forwarded-Encrypted: i=1; AJvYcCV9xl/3n96ouIUin8IhmzL8oFiodOPuUvmss1Fcws6fJSH159Puf7L+AhPhv1oXs3oCyPHjrbRGGE/5Y2jkQnc6K17mrIkY1FeN6jh73Q==
X-Gm-Message-State: AOJu0YwgVjlk5+9mL1kNhpG7WoKYGkNCm3YW4gHlrKAxR92jXY2w6eGl
	wmqv2/RZYt5WudKkX5ihB4q/SAt2bs0cq3e7V5jjT4N08YBl+30yAgJaFlIeF4AXYMnBsZTtRWP
	gf/vEAbz9i5l1aQT0HMsTLmqZ7sJJpqMu+/v8
X-Google-Smtp-Source: AGHT+IEQMWhh3nV9aez5d+6ni2K86V3OV0VRneIw7UhPzOP7WPGwPZT/EkagkQCNPUx6DvrcYQHDIAVWnJp2vdk7Evs=
X-Received: by 2002:ac8:6bd6:0:b0:444:dc11:6980 with SMTP id
 d75a77b69052e-4463fc66b03mr1309801cf.1.1719458773311; Wed, 26 Jun 2024
 20:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240626052238.1577580-1-aniketmaurya@google.com>
 <20240626052238.1577580-3-aniketmaurya@google.com> <07911285-d01c-4456-861a-825c1e9d65cd@linaro.org>
In-Reply-To: <07911285-d01c-4456-861a-825c1e9d65cd@linaro.org>
From: "Aniket ." <aniketmaurya@google.com>
Date: Thu, 27 Jun 2024 08:56:02 +0530
Message-ID: <CAMmmMt2K9H7WQ53j56kPSiZU+EUfCD0u_yBiyi8vaS4g+iHt8A@mail.gmail.com>
Subject: Re: [PATCH 2/2] i3c: dw: Select ibi ops for base platform driver
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_202618_732458_2A5A8F71 
X-CRM114-Status: UNSURE (   7.60  )
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

Hi Krzysztof.

> > The AST2600 platform driver can always select the IBI ops.
>
> So it is deducible from compatible.

Yes, you are right. It shouldn't be a DT property.
Abandoning this patch. I'll send a different patch to always have IBI ops.

Thanks,
Aniket.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
