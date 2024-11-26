Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A439D66B86
	for <linux-i3c@archiver.kernel.org>; Tue, 26 Nov 2024 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfdU7Pa7ovn1NqkSaVjU/p/bSucNhtzX2l6zpjkP2NE=; b=NiMgE32A32C3WY
	HE/YI8Z4jdVjrPfUAdTtaHFFiTMF82Ea9kVVnfbGnVypoS6kYqDGUgrqNHV2SglqXvSVCQmq4ToQG
	CFFmskLaVqoLswpJkijniyl4b0oIC5IUitCZ1+g6YlWc9opPOYJBQIWU4B21D/YF1DAqRqngz40la
	tikAtm10PVsRRWMWeMahxeznQjaovtzyDouq2b0X9yJKR++FWb7lANC8ji3qfziFo6lfJBN+cm/Za
	BwPUmpCRJDJTbTn2v1J7FiIHJzwTD0Kr7drkbFqkqQblG3GpO6r7OAbTp2XaRyq8uI/RuglGo9cRL
	L7xOfGbJ6UCMbkWJX9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tG4MS-0000000BqHr-3KSh;
	Tue, 26 Nov 2024 22:48:48 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tG4MQ-0000000BqHB-26w2
	for linux-i3c@lists.infradead.org;
	Tue, 26 Nov 2024 22:48:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9882D20002;
	Tue, 26 Nov 2024 22:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732661320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2fuJFpQkZX4WZzslAJSPKPwZmnXfglGpxbbC1xma2g=;
	b=annjVlWD820NC18XLR/zqORSa4BucF3Le6YVCk/slxRyvuKjj7krI//DfYirSrF9c9Hb6v
	/zVLrtTKGfDk2sGp11AckelLn5z4F19xzZ+KNDLMQl60AiT8ZH+7uC4K1e033DGcA+7bPf
	Zwxv/7YlGGDPgFzHJZwpg/vAoX0LI2i5t+NVeaFl5njoNKDH1hcCcOtwySRAOyW/1/s59Y
	pt1I8yDcLsQd/6LbCUn6FXiQFfQLPBYSXKYmcfo62hUFXv4s5LZYO+C7S/TjYf/W8EL0wf
	k+oxtt5xCRc1gQB8c3YvfRCCZlSS2cFiUXurujGIQg04d+SWe0n6TevD6CUIjA==
Date: Tue, 26 Nov 2024 23:48:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH-next] i3c: master: Fix potentially uninit variable
Message-ID: <202411262248395277af39@mail.local>
References: <20241119153941.8307-1-advaitdhamorikar@gmail.com>
 <CAJ7bepJ9vd8s4Yd+HpvGyZG3PE8oK8YPMFxtkPRO-W-t-Pe63Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ7bepJ9vd8s4Yd+HpvGyZG3PE8oK8YPMFxtkPRO-W-t-Pe63Q@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_144846_689770_D4BE8881 
X-CRM114-Status: GOOD (  20.91  )
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

On 27/11/2024 01:26:08+0530, Advait Dhamorikar wrote:
> Hello,
> 
> I would really appreciate it if I could get some feedback on this patch,
> I would like to know if this approach is the right way to proceed.
> 

Yes and no, I don't think -ENODEV is allowed here, see platform_uevent
and i2c_device_uevent.


> Thanks and regards,
> Advait
> 
> On Tue, 19 Nov 2024 at 21:09, Advait Dhamorikar
> <advaitdhamorikar@gmail.com> wrote:
> >
> > devinfo is uninitialized if the condition is not satisfied,
> > add an else condition to prevent unexpected behaviour.
> >
> > The variable will contain an arbitrary value left from earlier
> > computations in `i3c_device_uevent`.
> >
> > Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> > ---
> >  drivers/i3c/master.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 42310c9a00c2..7594d3793eb0 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -284,6 +284,8 @@ static int i3c_device_uevent(const struct device *dev, struct kobj_uevent_env *e
> >
> >         if (i3cdev->desc)
> >                 devinfo = i3cdev->desc->info;
> > +       else
> > +               return -ENODEV;
> >         manuf = I3C_PID_MANUF_ID(devinfo.pid);
> >         part = I3C_PID_PART_ID(devinfo.pid);
> >         ext = I3C_PID_EXTRA_INFO(devinfo.pid);
> > --
> > 2.34.1
> >

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
