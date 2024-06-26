Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65B2C30659
	for <linux-i3c@archiver.kernel.org>; Wed, 26 Jun 2024 09:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v6FDy6j7CPXUfSjkKfcUv+YPKkgr5AnJdoA7D7msbnc=; b=gOYop0SAeVbMU4
	6RMCQeQgwPLyEvWiCnc7u56IofxUHf0kC9TFg7Uix/GoY7NMmMVpsTl2EcI58JnUpDedGyrdil+23
	27E3G0XZC3J//h3mV4prR1lM4y+slYihkyqsHsoqNF5jd4/bgBTaNhXIIktJ3npu64wxxlO+6Fb46
	2gXcr3x29mAQctd0QKiB9bW1GTzFGU00iGXN0AdwTGWbw6DpR4envQFZHmrJ4cnGCgQyte1+JzUvy
	sXPlWfnoMSXft9671QE6ze9WIGyobf9qmr27tgwUQECrApfhiuTvVjQZrr8osLn5WAT5CeGWQfb+j
	66HJqGjEe++UipjpgbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMOkX-000000066W8-0FLk;
	Wed, 26 Jun 2024 09:15:33 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMOjk-0000000661y-35JE
	for linux-i3c@lists.infradead.org;
	Wed, 26 Jun 2024 09:14:46 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4450111d54dso192401cf.0
        for <linux-i3c@lists.infradead.org>; Wed, 26 Jun 2024 02:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719393283; x=1719998083; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CqAYMziyoNuRluoEnLOJXX4U9aYsyGmmCsxq79X7UAc=;
        b=rdpEIbgz78/F+KeqcINVYUYHQdcyLtqLIT0G3Jc3+TLSqQMoew1ImLZBKabKJzuJrY
         VISy2HkwQTQD2lo3P+7yaI0vJoK12qwauupIKe9m6NdHCbXl0hGNS+kb++RFrKx+sBPK
         ciV5Xi5NGtSAR9/J8PkW8KwMpzpUQHe5upirwFJp7ZzXj/47ZLClEBQmhH8BMQFAbv1p
         lVxic5f8ZyHi9L5RbnefzulP7HQBInZoV0ocwbfDSJmfos+WWfsNvUsWePJz3DAljcaD
         pCDtV1Gd81DTvrxl7rOIZ/MabAbnu+VbjuDTH0uYdA28qP6gTJ8dMtBlTwJsCIzvQGk2
         iidA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719393283; x=1719998083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqAYMziyoNuRluoEnLOJXX4U9aYsyGmmCsxq79X7UAc=;
        b=J9G7Fe0dDp/oI4R8MYKgXPqv0b3WVzactp4Wwp8UtxU8AWdnZ4wx4wFLdfS1wwuog1
         LXTPAFzkuUx4dX7gszapmtp/iCd/J5Hl0IOklygc7E4MIUo0IYl3xyyC7HRhCWATpYMA
         reJFMDKEs/fb3kooXgbb/Slf6IQdwov60VtRUlIgbmwaPM1PoLIxI0bE/jzL19CCQkXp
         OzimyQLxePw73B9pTH0DyxVf2AbYSKifiQVhv1yB1iBVv3YnfHk9xt7XOlflMGQwDWms
         9gmix693yffgBvaqtRlJajzNPpqcPHsIisQp3892i1Mstmw3K8sdAcGGieB0LX9EwXtz
         1GnA==
X-Forwarded-Encrypted: i=1; AJvYcCUHMvIOQF8Elu/q7i2so4wtUAEr5xBiPwF5W2g7youCWpTYxo7yiRyaLDj7tzZLiida+kYW/ukmno9I7X5RsuaEGw5THAW2IzOPbdCv1w==
X-Gm-Message-State: AOJu0Yy+gbzVkRvSk2KLXgrhiq/oHwJS/+aXfnKMieYQUmjqNxPgFJTe
	Jh7SAs0QonzR3sFII9soA2p0FemFDpCDlFUspIrw82pgu6qU6CN1ZOFPLScUOwPaMQ8c8oRMc9b
	UMh/oaa1sgLOhLI7ZCkeEXTNOQW6i10GMIhbb
X-Google-Smtp-Source: AGHT+IHkOrgqoJzL15wN5VWNjha40DP90+u/qO+zEEscGdt+igLxMIgnKhcvFKbglDydrmGy1fqEppkFSUrU9cbE+jE=
X-Received: by 2002:a05:622a:58d:b0:43f:fbb0:b74 with SMTP id
 d75a77b69052e-44542568768mr1806941cf.29.1719393283332; Wed, 26 Jun 2024
 02:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240626052238.1577580-1-aniketmaurya@google.com>
 <20240626052238.1577580-2-aniketmaurya@google.com> <e28ba03d1df1c0c5aec987411c40e44fc351ce0d.camel@codeconstruct.com.au>
 <c15045b4-2e5f-4fcc-b25c-76a5e4973e93@linaro.org> <b4ba5fa7834fdfb1a1e26ff0e01b9bb235de63b5.camel@codeconstruct.com.au>
 <CAMmmMt25nkZTXXLCVGv1baf3azQR0kwbM8LP4EzCQKOPLUhbVQ@mail.gmail.com> <d256cd72ef2011c3bfd045b04fb6509d1ac827e9.camel@codeconstruct.com.au>
In-Reply-To: <d256cd72ef2011c3bfd045b04fb6509d1ac827e9.camel@codeconstruct.com.au>
From: "Aniket ." <aniketmaurya@google.com>
Date: Wed, 26 Jun 2024 14:44:32 +0530
Message-ID: <CAMmmMt3DZWA734iFGLxz7cj+hYiWgq5MDOrc_UJpYeaij+yywg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: i3c: dw: Add property to select IBI ops
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_021444_830964_3C1455A7 
X-CRM114-Status: UNSURE (   8.89  )
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

> > So can we remove this selection of ops and always go with ibi ops?
>
> Sounds fine to me, but I don't have direct experience with the non-
> ast2600 uses of the dw core.

I am using dw core directly through Synopsys virtualizer development
kit(VDK) setup.
I think it should be fine to always have the all ops supported in the
SW as they are in HW.
Shall I remove the ibi_capable property from the dw_i3c_master struct?

Thanks,
Aniket.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
