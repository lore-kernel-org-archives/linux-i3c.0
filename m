Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58802D10DD5
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Dec 2024 09:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JhbCuAuGvU1L+eqzCcbQE1lXG5rD+9cAbD88Gpc3uHA=; b=aCC3uxCF4OniWs
	WX9SsoukgSAMxnXTl1qUIZEksXQ02r4PhtZ+6UWx1aEeTK+uzvUBmSSloBfgpUd1H4Ir+fIIhUrIl
	IA4RSgwXsGcwz+kjzWDy735VdcnFA34bwVdHjHi8Lk6EOBvbLEEMsX4ZUneA175dYOatLHv0itymF
	rjEyP3hfipyBx+grNrwEJktJJEaj0mjRv/40zouAYZJw3dqmcHiicSTKyYJ9UXPAYE2Bg3rI9yw+D
	BatSsk1QmD7qAPeHWsB6zNN44EG2MVc4MCQxQX4q8/xkcJuDRnt6hEnIr6K0bh5D/7d85eL7Tz+Mo
	GcMB380mnzIf8TPJbqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2NR-00000005VNi-0Tzm;
	Mon, 02 Dec 2024 09:05:57 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGF3u-0000000Co3W-0URr
	for linux-i3c@lists.infradead.org;
	Wed, 27 Nov 2024 10:14:23 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ffd6882dcbso4551671fa.0
        for <linux-i3c@lists.infradead.org>; Wed, 27 Nov 2024 02:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732702460; x=1733307260; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8SF/u3Kdyele1Gw5pa2FdRL14/nwlUm+VEkXrZYjykA=;
        b=bqokUnGUNn57aLrXU4/JZhlUSc6uLxYiF8tkYO7/F0bGGcag92Iy/T8Ljwken7gfd7
         T6Pyu6AVtV15miAvDxJi+I46aKmi/0Rpu48wAHLKYa9mIr27CfIfcvDj55ADA6cwMncG
         Yvm4TrI5XU5OC1vbvSOgi62/NXvvpC/puvK7FWq8wpx78JLxdD5x8FGSYkwEYsSIzNwe
         xZ/7JDtQmkcTwNTyMCNwFIX+O6phmAbK6BRAqXPhKAB9TJAdXHX0piGuBu9Z7UZObqjs
         4NRTEZasULqUh0KsKEOwzlr7fTj/xOx/9Aje4MGhWSTol2uB+aD5dfw3Fu1wCj00Kmw0
         w7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702460; x=1733307260;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8SF/u3Kdyele1Gw5pa2FdRL14/nwlUm+VEkXrZYjykA=;
        b=rFRDr82be606eevGEWYaDVrGiXchKg+qOtkAplyYF3U2iVZHHZRDh0eUtaTKZDNClY
         PdS+UlFw4OrmmIy1rMoPK6gjhlXLpasQhmJAlCh6dlkVrnA88i5msEMf19nMmiSFOFre
         K+sKNu1SOd+1ePX4OtQnK+gIK423X2fQGsE91TDD0e3eKDPi4M5U+p2bbidkfo/CNrN3
         faZTC9iBNGiPjRMA12SHjsQ2yeFiiLyX5S3DSouGHFfEBe/nEQnNKytmoaWSi2qL/5+J
         V4E/9bv2flD+m1LJILl7zWGFu2H6qGhcf3KA+6+6fdpGWjIO5+BHNChUr+3RVcH0VZyz
         5+og==
X-Gm-Message-State: AOJu0YyhyoLDQ5AOWwhRamJQ2AceTVseB9B23PZc78K8xnRhLLGOWKj1
	NK8KdgV5a9YslKffv+T2vV31DodfJLEfGx5FgHeG3YtvmOqLGVRdExHH0C+9mdAOnXRcLZhfJwv
	tZdwINaOgdTbbHpa0g1hUZ7AghLp+fNB7
X-Gm-Gg: ASbGncv1UCx0+Bu79Fm+Y2EkxbswdnCMDRpYI4egS3HQNoTKVum7fk2CY3FWOeDCwys
	LSe8zHot6+OtZ7kcgDwt98gWjpYMq7Kh0UDwxkQpAhngKj9dAFxciDKGKc/tsUw==
X-Google-Smtp-Source: AGHT+IF2dxXz0WdUwwnQcsA4C1kLqtW+yUfnZT3lt19jRglq/d6SHa1adRS19e4hggnZItqn3H03ch/9FbLUjE89uZ0=
X-Received: by 2002:a2e:a882:0:b0:2ff:7a4f:e770 with SMTP id
 38308e7fff4ca-2ffd60ac565mr7217171fa.31.1732702458697; Wed, 27 Nov 2024
 02:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20241119153941.8307-1-advaitdhamorikar@gmail.com>
 <CAJ7bepJ9vd8s4Yd+HpvGyZG3PE8oK8YPMFxtkPRO-W-t-Pe63Q@mail.gmail.com> <202411262248395277af39@mail.local>
In-Reply-To: <202411262248395277af39@mail.local>
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Date: Wed, 27 Nov 2024 15:44:07 +0530
Message-ID: <CAJ7bepKvu_mpJF47WtanZLDsbbx5+GhFkKSKmOdjgDoGQZe-uQ@mail.gmail.com>
Subject: Re: [PATCH-next] i3c: master: Fix potentially uninit variable
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_021422_151444_04E39591 
X-CRM114-Status: GOOD (  26.15  )
X-Mailman-Approved-At: Mon, 02 Dec 2024 01:05:09 -0800
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

> Yes and no, I don't think -ENODEV is allowed here, see platform_uevent
> and i2c_device_uevent.

Thanks for the feedback. So if devinfo is uninitialized is it possible to
initialize the i3c modalias using OF and ACPI uevent_modalias?

My humble apologies if this is a trivial question but I'm not really familiar
with i3c and found the potential uninitialization using a static analyzer.

Thanks and regards,
Advait

On Wed, 27 Nov 2024 at 04:18, Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 27/11/2024 01:26:08+0530, Advait Dhamorikar wrote:
> > Hello,
> >
> > I would really appreciate it if I could get some feedback on this patch,
> > I would like to know if this approach is the right way to proceed.
> >
>
> Yes and no, I don't think -ENODEV is allowed here, see platform_uevent
> and i2c_device_uevent.
>
>
> > Thanks and regards,
> > Advait
> >
> > On Tue, 19 Nov 2024 at 21:09, Advait Dhamorikar
> > <advaitdhamorikar@gmail.com> wrote:
> > >
> > > devinfo is uninitialized if the condition is not satisfied,
> > > add an else condition to prevent unexpected behaviour.
> > >
> > > The variable will contain an arbitrary value left from earlier
> > > computations in `i3c_device_uevent`.
> > >
> > > Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> > > ---
> > >  drivers/i3c/master.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > index 42310c9a00c2..7594d3793eb0 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> > > @@ -284,6 +284,8 @@ static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *e
> > >
> > >         if (i3cdev->desc)
> > >                 devinfo = i3cdev->desc->info;
> > > +       else
> > > +               return -ENODEV;
> > >         manuf = I3C_PID_MANUF_ID(devinfo.pid);
> > >         part = I3C_PID_PART_ID(devinfo.pid);
> > >         ext = I3C_PID_EXTRA_INFO(devinfo.pid);
> > > --
> > > 2.34.1
> > >
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
