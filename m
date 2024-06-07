Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0151C27C55
	for <linux-i3c@archiver.kernel.org>; Fri,  7 Jun 2024 06:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ARLfi2bYGqiQ1cizK225L4+SlhnNSKo7RATuvF1VuLs=; b=T1qYR1Q82ss/GH
	0MPCyJz/pch3vXCMgNeyo3AAe6djmsEht7XFzCRO7kf3Vb4/61U1wBrmZBsAEe5A3PVyIm653gRGA
	WhlXocmYj14mnO+GfNuVuu0MUapcf4yijEmJfV+gh8eIEd9Lb3apRUC6BQs4yPQiRU7lPMxWVq7C9
	XAjVyHhWleNB7cBtAgoArktDO1H4rPmTT8GrZZP2gMGSlrvyzEzWK5wKKqC5ha9LimpXqO5UbTmk6
	1UdUN3Ec0B3U5Q8Y9j6x86+wUgoWDDtGShJDLmrB86OFlo3SzHVZLkT7Li+vPAP1ADZY1Z6dGEMtD
	0r+SHgS9+qtSabd54WuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSpQ-0000000CdCS-1Dc9;
	Fri, 07 Jun 2024 06:11:56 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFSpI-0000000Cd7D-0sNk
	for linux-i3c@lists.infradead.org;
	Fri, 07 Jun 2024 06:11:55 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4400cc0dad1so230141cf.0
        for <linux-i3c@lists.infradead.org>; Thu, 06 Jun 2024 23:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717740706; x=1718345506; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nsZI/xHYSQm/+dnfipss02DR7ScDWJz4B6NrYN28zeM=;
        b=v4WsXA3s4ye/ae5wTRw1aV6d0iIX3r0zRuE4Zvc3cvnOz+lpAYRXjATorOziYBog8H
         vjLcXGNpOGDsuYqLA+kTtZisTYnHTa2er61Z+x3Gt5lbsGmftqaMpG5S+YY6TDq0DY9Q
         My5WRzxaQ0E9o8G0XfL50MGpp/TSGjV/dSPEFclIZ7UleI/wzrgRLdaVzoze8OGmIc6P
         kKKSDLFJkF/BhEV5R6MeABTGS+jaJ92wI3cQjRzoOfsrHjFFlJoRpTJ2I7cGY07VEnH6
         CFhyw+9BPp+A0/xVRR2hXhEPVSCkVt2k6wBPyBmWVL2Iki9AbttkK8U3LRa+H9v2b9DT
         z47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717740706; x=1718345506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nsZI/xHYSQm/+dnfipss02DR7ScDWJz4B6NrYN28zeM=;
        b=qfXL2MuI3DvF/6nALB7Hm05liSjfDy3uBUbTBl0T0pDtNAEwlE+ux8gJYEKfzecafF
         aKvig5aKoLW2Wp1Xnx6FwZOgdRMNf7e0l9ZvhlrmUCyWmUH+5WVlVxz3xVcxzgA13MTU
         /qvj6KfTGuEY4SGk6CDNNG/OPdP1qppNTWlYV84WU2cBVZcyAtSPx5OyvAh7fPTi9C5H
         74fwIbujB+/ls2kodgayEg9a15sgZY/+Q7JjZB3W0JImerIlxCIewzDh4Cvb06QaTgL2
         HsNSSfmd6x76u9jMN7BNcirmlPY9WHt1mQYgjeFlQNW5uAwVgBKyrUhe4lbEzCaN1bkm
         hJnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoeq4yrcLs6pwi102KM5U3/QTbzJ+8VSJitoi0xD90U7lNb9oCTuR6R9LSWUaNRKWuLvIx7SvVtJqmxpeFiLn4bGAMVcA1IlZaMtTC3g==
X-Gm-Message-State: AOJu0YwDwZrfLFEorLDrf6x38HoU3ic2hmyDtOJ21uDOZytfnl1fwffs
	M64WxcdFJoSEzJ0f37PS+XiBa/oTgWwzwhUD7cTypvcMKtBAxXDxRja7ZhQBizPitBdtsrddF3m
	7ZidYe6o0+0yBuR6ZaNXfiiAnDbERSpMc9WSt
X-Google-Smtp-Source: AGHT+IHIGntdfVER17jbc4kETFkRliSQf8UfFv43Za9kOG4EzKX6QZI299z1mCNGrB6uQfkliufbSyrPWQ/1PA9ZFII=
X-Received: by 2002:a05:622a:6104:b0:440:2d56:488b with SMTP id
 d75a77b69052e-4403726cbe0mr4901381cf.14.1717740706174; Thu, 06 Jun 2024
 23:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240606124816.723630-1-aniketmaurya@google.com>
 <3c6c319f3aaa60428fd28f4d95c71dc9a8150081.camel@codeconstruct.com.au>
 <CAMmmMt3u=DB5onXdayMN5ZHvCmdnam4wOo0hKizve4K0LnZLZQ@mail.gmail.com> <3decb5293cb8fb2e8725600a8c5c930c32178602.camel@codeconstruct.com.au>
In-Reply-To: <3decb5293cb8fb2e8725600a8c5c930c32178602.camel@codeconstruct.com.au>
From: "Aniket ." <aniketmaurya@google.com>
Date: Fri, 7 Jun 2024 11:41:34 +0530
Message-ID: <CAMmmMt2guEx1jajb2NC0iBnMGpkd2vaSiXg_BqgZhwrA=FARLQ@mail.gmail.com>
Subject: Re: [PATCH] i3c: dw: Fix IBI intr signal programming
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Joel Stanley <joel@jms.id.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, linux-i3c@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_231148_382214_766A8AEF 
X-CRM114-Status: GOOD (  12.08  )
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

Hi Jeremy,

> This is more for handling IP configuration options we may see in future.
> For example, I believe support for target/secondary mode is entirely
> optional too.

I was hoping to add support for target/secondary master, we might have
different drivers instead, something like what's done for i2c-dw drivers. But
that's a thought for another day.

> I think keeping the mask value locally would be best. this means we
>
>  1) cannot get the counter and mask out of sync; and
>  2) don't need to do a read-modify-write on a register that is only
>     updated by the driver.

Sure, let me make the patch.

Thanks,
Aniket

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
