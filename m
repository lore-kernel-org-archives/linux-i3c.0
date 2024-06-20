Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B683CC27C79
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Jun 2024 06:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUVi8ZbNB4ceR7ZJhEz4RA5d6iBPbSW6CmVcFRsFXoM=; b=Vrd/LyGnFTjk33
	P62ZlM1bHa2Tt1+GUId1HhBVrosBXgEWYD6NU5uiyMjHdzrltuY66XVNEEoJ9VTpXd7+iu3pRFcAB
	y+n2tACTKgzlJsqRPKob+spt46BeK3KqAA+yuRgHkK+qi/J2ylH7x+SDuhvjHbB/Y/rZwQ9NvkJ21
	89WGqfUs7u7EXtdqYm+cXl6PAAevufHGEiUNh8F15gTP5ZlPCi+EH9zM1RolpZdH3mDfnY9Tndk4d
	okKmMIrarWtfBJvrXsgwmW8eNIRuxMKHRV1csvWK/I+9DLaCR+xEp1kYzKAqns6LKJBUCKu7h6E7e
	6Hl1CvttvQRwON2vyH9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKB2I-00000003lER-2NTz;
	Thu, 20 Jun 2024 06:12:42 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKB2F-00000003lDQ-0XwH
	for linux-i3c@lists.infradead.org;
	Thu, 20 Jun 2024 06:12:41 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-443586c2091so678611cf.0
        for <linux-i3c@lists.infradead.org>; Wed, 19 Jun 2024 23:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718863957; x=1719468757; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6MDp6Gu1dB3kA3pFusfmm/YJymGwGFjMgRsVqOFAv7U=;
        b=Ya5FrjwHyVX84r7RvJjarMHCVlbVUXLw/xMScUojKZs8ywcZGPM3MDxNxG+fuLJMQJ
         QT5BgBpLHsFCM2xob49GrAOSjuqNc0myqDQGu1BouS62Fj99BdPS/S9C6a0ObLx1775s
         JYRv13zzxFdn9Gitmqp4lw+l8BuDsthtKOO2Pa+vLPur1GasekpmZwEmjuSsY/ijMzZR
         jJjiJSR86ebZ0sXQivmC9IuOYirOKLuyyLlHILy1BLOyDjaLPQbTuPwYduGvPJ5psrV+
         UDephbyAcc57j2XpZKkTiSem+eqm2vY5Nwg/WVBNmUHqwvHon0I58gHmaatPtcSaM8A3
         DlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718863957; x=1719468757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MDp6Gu1dB3kA3pFusfmm/YJymGwGFjMgRsVqOFAv7U=;
        b=iHiXEWNamVUX+/tO+nN2fH6EHg7a46OJW9jLagWInIcuFQEiILa/+CGCHFyyzzDhxd
         MRH8ijGAsNCAdirWmJzoWbRKYHMrLFL2kbX/nBPjQNGe5erSThdlQlGFK0SRcKuVQbN9
         MNlT6uJuXlWvgj6nwrL8usjiznGctJzPlYeTF+LNmKTtECN/nj9fX/kPgoPjkpz6Nsjz
         k7jWR/G5fL5grElI2HHWxL3jhYnt/BJLqaePKZZYcnRWGTAUUe/pkZNyGhOVS1/mQH1C
         7aKw4sojUFrAjvP99Kv2/7faYQBQqE5868OP4E31vGI9U2lw96O283tnWe8umwSED6d1
         fCuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdyu9wF3SZTjj38pXgZ2G5xVc0O+DIjKypxjZzk0TLIF46A3ZP3f1H8SsrzzoweiS7kmaVcdtbIIQXUnv3wOE8T40nJ5RycDtCzQ5ChQ==
X-Gm-Message-State: AOJu0Yz7edHfcKRKgKdz6jdLym2ML+kZHWKLzvgzxvEt3MIMNoSIGAZC
	3MBwQcdczsHqYHPd5MUQWtqb5gc/mv3nS1jmbKpdf0LJ9phci5JcEfEsRWluOKvFuD1cGzTsBZR
	dwIXX5eLZpbuLtMNJxtCXt/G6KVn0rLjCf7t9
X-Google-Smtp-Source: AGHT+IHNWwGYLve/6F1QWlvTiTVYGmQ4H8cLjWmI+lXR1LrdOwVRPseIr/mca32BSn0Ip3ODypzRKhOpFo2sA5ibuss=
X-Received: by 2002:ac8:5708:0:b0:442:172e:4dd2 with SMTP id
 d75a77b69052e-444a902844emr4894831cf.18.1718863956650; Wed, 19 Jun 2024
 23:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240611171600.1105124-1-aniketmaurya@google.com>
 <20240611171600.1105124-3-aniketmaurya@google.com> <202406182005584f0deea8@mail.local>
 <20240618200932858a6e40@mail.local>
In-Reply-To: <20240618200932858a6e40@mail.local>
From: "Aniket ." <aniketmaurya@google.com>
Date: Thu, 20 Jun 2024 11:42:25 +0530
Message-ID: <CAMmmMt21TAH3Vp8axtY9PoM0K6gzQqtMiHTaNGXKPW3J2DJF-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] i3c: dw: Add optional apb clock
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Jeremy Kerr <jk@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_231239_197081_1CA32A74 
X-CRM114-Status: UNSURE (   6.15  )
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

Hey,
> > >     ret = clk_prepare_enable(master->core_clk);
>
> It could be worth having a look at devm_clk_get_optional_enabled
Do we want to use *_enabled clock apis for both core_clk and pclk?

Thanks,
Aniket

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
