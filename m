Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC9AC44520
	for <linux-i3c@archiver.kernel.org>; Mon, 20 Jul 2026 16:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=946ssnzBvd5EI5r+HJmqY43lAO+4pJn8zrVL765YMeg=; b=wCqwJ7gF+AQFmj
	fx6Df5mqVSBTlIJ7p5C1F1zbHiI6v3DDY+yg5LAUgS4Uahq0h3lAQxdNO5BlPuPz+rC8n1bY/I+c+
	T0ptyqsulqy5uhu8QjJOdzbuks4u2Jsxf7m4ZY34ZmyQZyNOKKV/KrchHFS3JERB07GKzrczD6hyF
	RKtwrK4gcwQCSV6JXy8WeOuFHBsNQMtpFVgXCv/lZbqtPI0wXZDy7u0p+VCzbHqb7WOgI0TGqMYdl
	fNIdwN7et0JXChjHnb9BdSE06DwVlX9LzCBBMi5yD9AlnDPP/Q4qKykGKCSx9imqczxUEpM2XnU6I
	cFTuVWYmPEtX1UN05qYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqWP-00000007JNr-3YY7;
	Mon, 20 Jul 2026 16:07:13 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlqWM-00000007JNK-0rkV
	for linux-i3c@lists.infradead.org;
	Mon, 20 Jul 2026 16:07:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 48B1B4E40E75;
	Mon, 20 Jul 2026 16:07:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18F8360360;
	Mon, 20 Jul 2026 16:07:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6EC211BD3CC1;
	Mon, 20 Jul 2026 18:07:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784563624; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=utWdvu19UNZoxJGvC9DGJv7trvlZp6J4sIOyLrpLToc=;
	b=SfEVFH66oqT+dpdZlYmxW8cXj8hCgnZvQ97i28dcV+BpRyTibFoFlF/Oc1X5s32eT+PHe7
	kWk35LUlaNlwXb+BsJPoSV2izZ1wPTJ6HUES4TVmdVnreurls+o6M6gwdyLnwWVNP1Uh6s
	wlFjUNlZTqmESIhVINyYXkDn/+v7sVGy8sjtpvEaC9mKh6jxQAfDIZTshLJO6HURGVZdCC
	uMY+fUKdbDbU4BUFDGRhmEAClWdR+bQqydFPF32+osTDh3fls/Jpd5fl3bhNF/e5kYCZbL
	okwjeC9X6VESZV5XsND/gpGsei34x1TKpx7vXoV/I7KUh461x/+MHObPyANCtA==
Date: Mon, 20 Jul 2026 18:07:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: frank.li@oss.nxp.com, Frank.Li@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v5 04/12] i3c: master: Add support for devices using
 SETAASA
Message-ID: <202607201607012c70129a@mail.local>
References: <aj0iG5xplWPWc6m_@SMW015318>
 <20260703090855.1519255-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260703090855.1519255-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_090710_383555_78232C3C 
X-CRM114-Status: GOOD (  22.95  )
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

On 03/07/2026 09:08:55+0000, Akhil R wrote:
> On Thu, 25 Jun 2026 07:42:03 -0500 Frank Li wrote:
> > On Thu, Jun 25, 2026 at 09:38:15AM +0000, Akhil R wrote:
> >> On Wed, 24 Jun 2026 13:57:46 -0400, Frank Li wrote:
> >> ...
> >> ...
> >> >> [Severity: High]
> >> >> Is it possible that sending the SETAASA broadcast before direct SETDASA
> >> >> assignments breaks initialization for devices that natively support SETAASA
> >> >> but are configured for SETDASA?
> >> >>
> >> >> According to the I3C specification, any device on the bus natively supporting
> >> >> SETAASA will respond to this broadcast by adopting its static address as its
> >> >> dynamic address.
> >> >>
> >> >> After this broadcast, the driver iterates through devices and attempts to
> >> >> assign custom dynamic addresses via direct SETDASA commands:
> >> >>
> >> >> drivers/i3c/master.c:i3c_master_early_i3c_dev_add() {
> >> >>     ...
> >> >> 	ret = i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> >> >> 					i3cdev->boardinfo->init_dyn_addr);
> >> >>     ...
> >> >> }
> >> >>
> >> >> Since the target device already adopted its dynamic address during the
> >> >> SETAASA broadcast, it is no longer in the unassigned state and will NACK
> >> >> the subsequent SETDASA command.
> >> >
> >> > Look like correct, but I am not sure if target will NACK SETDASA. Or should
> >> > use SETNEWDA for SETAASA method.
> >>
> >> Yes, this looks valid for mixed device buses. I can move
> >> i3c_master_setaasa_locked() after the SETDASA handling and before
> >> i3c_master_do_daa() in the same function, so SETDASA-assigned devices will
> >> ignore the later SETAASA broadcast. Does that sound good to you?
> > 
> > yes, try it to follow spec.
> 
> I just noticed that the specification says: if both bits 0 and 1 are set,
> meaning both SETDASA and SETAASA are supported, the I3C Bus Controller should
> use SETDASA first.
> 
> So moving i3c_master_setaasa_locked() after SETDASA handling follows the spec.
> 
> I will wait a few more days before sending v6, to see if there are any other
> concerns.

No other concerns on my side.

> 
> Best Regards,
> Akhil
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
