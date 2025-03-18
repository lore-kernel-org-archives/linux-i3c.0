Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2232EC35FF3
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Mar 2025 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P1Npdo0v97m8cFvcKVjDIguFWZZsn2/tYf4Y1hXQL0Y=; b=2ggGaKiCzGFcFu
	oESRqiPjpuxCkSfG9kz0zTSQ/GZShRH+udFzKN89/oLqnZwdTg0d9ufc86rRIqXZF82YCzot9R9kg
	gM2av4BqDoilmSwH6lt6mBQq28V39/7zKetVi5sqFSdPR6DIIvcltRFmkchzI/VUamPVvhdyRMx7J
	a72wWRCgO7YPoVbwSOyaUWKHuGwmYPLHcsg7UoxCKPoBzFgzJ4/SwZquMabKuw+rFmY9NIoJZCMHU
	b9u6BBzQ3HejFq4mjXR6wPWqKIBrSWQpWYNdjFCG2KyBK9dw35mjn8Bt6AVy9sd6hoSQHPk3m8+/Q
	33nUhaK3aX5Rb+dPvOFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZEG-00000006PsT-3mPw;
	Tue, 18 Mar 2025 15:51:44 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuYIT-00000006FMj-0cmJ
	for linux-i3c@lists.infradead.org;
	Tue, 18 Mar 2025 14:52:02 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso24943635e9.0
        for <linux-i3c@lists.infradead.org>; Tue, 18 Mar 2025 07:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742309519; x=1742914319; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmZFMU52ggHv/uxQXlUIKSkNor6eZqTTV/Z26Ntqf5U=;
        b=LrOh0sA6HwL5/XcgD9/twi4mS/lgPza+kx0T/cVZ6JfNw8dRBG+2E6Am0T2wvA8HcP
         lCh19CbSEGGn6zom7I7IkuUg3t2AqwrFQXRTt4u1kPm0Y7jUG2XjODM0SAvJlQQkk69n
         p/HivccR8UgQ1iMf0b0BQrMvgnhY2D2cLJPwg31Emd6WiYPj5yNAWny+43d7UmcT03L7
         LIO6hHaSKmPlB5jA/tdy/NzSBOoqRGBq8Rp9slB8el4esglOJvrDBI9sBicGFL414Yeq
         pjY8piQCoKqlRzdMz7UIXphXc2trPez5Xrz4j3XL5KLNnMVXK8jbFCOk86DE3amNMT2V
         3L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742309519; x=1742914319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmZFMU52ggHv/uxQXlUIKSkNor6eZqTTV/Z26Ntqf5U=;
        b=nbCJ9M4vSuqmKa5OyiXO5cXYkFr6WFhe5B+x9V+wcaKApKQyHxSqdyTx3VACzlypWq
         5pB39NqtUDmfLpqQQ9Xt6F6+sdywKXkMmYL8wbmo9PasRsgspYjovjwLiP3/A2ByznZK
         sYCNE+6ZrQguC4TJR3NlROSzDX6r8e5XU/9s4WsNUx4s4hsUa7AMamMqROrRsA7I3sox
         vy7Pb3Amlg4ssYkq+TJFsR0TisKx6EF5UNhRqDVheSwuZMs4HXqnz48JhHXsg8ymUcUs
         VTCQbzADH3yMOCqf0d5V/+36PTpOcjV+aEivvjonP7Vy8FdGIA6b/ycFZD+ecCGNNQk3
         CHiA==
X-Forwarded-Encrypted: i=1; AJvYcCU1ORH4r8UhFdSIng9Sxgnohs4FhDCx+lurzFYl55MEOw8bY4I7nJEIkWe/kxtjprXzM7FV008qgbk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMTdr0eAE4EwxQXusRdR1GBz5B9OKKwYF38qF3BWOuTl+rjkua
	ObO6sH7XRRGAqefppGnBf4kcjaASIHYA+RbSRx+1Y8691AXdNw7+
X-Gm-Gg: ASbGncutCvk1A4dbhJcEUd9C0mirEiLA9o/pPnVkgQ4RejW12vv4NW9J04Uje6bX0bV
	rdENaS+gLTsZ3Qnv/pSMto3JG/4SyI9Z69Jaj05lCXd+FjV+cj3sscs4MrIUna2Tb8/vhwtLVfT
	tdv/I3djIz7z8A23ZRYRxk2ZqQxWEGLFsclSYE/gF5OaJYx4U4ZHMKj5g2je1y3+Rlwx7OfkdVL
	HrqoZUeF9YH+gSIBSFWGY0qjeu15hzwXLus1hfGrZDWPw+0oKR6Fkk6vkYTAYwU/B+umrOZqE9u
	ZxZLJVcZ7e70X7KKICh+PBwdqDHg6HDyS9GZ88KjqQsXfH4=
X-Google-Smtp-Source: AGHT+IGxWW2bln7EbsKSCI2v/veWnprS2ogGfQvgu/+i0PWPhdsfLcc2mml+LBsDf+xF/aKKiMurmQ==
X-Received: by 2002:a05:600c:6dcc:b0:43d:a90:9f1 with SMTP id 5b1f17b1804b1-43d3b9502d5mr18784485e9.6.1742309518667;
        Tue, 18 Mar 2025 07:51:58 -0700 (PDT)
Received: from qasdev.system ([2a02:c7c:6696:8300:c99:9d6f:1130:510f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fac7asm138937955e9.28.2025.03.18.07.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 07:51:58 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:51:49 +0000
From: Qasim Ijaz <qasdev00@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: miquel.raynal@bootlin.com, Frank.Li@nxp.com,
	alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i3c: master: svc: Fix i3c_master_get_free_addr
 return check
Message-ID: <Z9mIUc6Ln59umJtT@qasdev.system>
References: <20250310023304.2335792-1-yschu@nuvoton.com>
 <174225158210.1593610.10018812780731849409.b4-ty@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <174225158210.1593610.10018812780731849409.b4-ty@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_075201_184352_3AA0EB14 
X-CRM114-Status: GOOD (  18.73  )
X-Mailman-Approved-At: Tue, 18 Mar 2025 08:49:19 -0700
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

On Mon, Mar 17, 2025 at 11:46:29PM +0100, Alexandre Belloni wrote:
> On Mon, 10 Mar 2025 10:33:04 +0800, Stanley Chu wrote:
> > The return value of i3c_master_get_free_addr is assigned to a variable
> > with wrong type, so it can't be negative. Use a signed integer for the
> > return value. If the value is negative, break the process and propagate
> > the error code.
> > 
> > This commit also fixes the uninitialized symbol 'dyn_addr', reported
> > by Smatch static checker.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] i3c: master: svc: Fix i3c_master_get_free_addr return check
>       https://git.kernel.org/abelloni/c/d6cb667b8e15
> 
> Best regards,
> 
> -- 
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hi Alexandre,

I sent a fix for this issue on the 9th March, which is before the patch
Stanley sent which was sent on the 10th March.

You can view my orignal patch here:

https://lore.kernel.org/all/20250309164314.15039-1-qasdev00@gmail.com/

Thanks
Qasim
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
