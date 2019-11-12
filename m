Return-Path: <SRS0=OcJI=ZE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADD1C43331
	for <linux-i3c@archiver.kernel.org>; Tue, 12 Nov 2019 07:41:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 710A7214E0
	for <linux-i3c@archiver.kernel.org>; Tue, 12 Nov 2019 07:41:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PConJxiG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 710A7214E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmBDFA2PAybu/BYFkfnRxluPM95EvgfO+66LG4M83Dc=; b=PConJxiG8p5/qj
	JJ5sHqQGtXhPRl9GWhTvvfrAHX1PyCdoU15pf9hWy4gts5CayNaXhbUkut1U2qI/mIjfHAaE+3Tp/
	KuonawwB+hw6kEM9Hj3aFI9eF11ME7ftph0fj76vbvynX4yvp+Fq/lI4q4FQ1mNVsmBeqXuhIxXXb
	vz7kNYade+HXxb5mrddy3lK6qP6OhxgUzZLE4eicH0PUil7MJrbsIYwJMx5J+5uHFaoKjQiu79q7K
	CR8drcutyTZT+R7HQLuA8GRol+cBa9caM5iQARvTG8+7BY5tgSkaabiWTc4d/nNGIzjidbJz/BDmT
	58+uj9PGcKRm7xRJUziQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUQnu-0004LI-QH; Tue, 12 Nov 2019 07:41:35 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUQns-0004Ku-8v
 for linux-i3c@lists.infradead.org; Tue, 12 Nov 2019 07:41:33 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5FD6B28ED6F;
 Tue, 12 Nov 2019 07:41:30 +0000 (GMT)
Date: Tue, 12 Nov 2019 08:41:27 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Subject: Re: I3C Mastership RFC
Message-ID: <20191112084127.6efc6fac@collabora.com>
In-Reply-To: <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_234132_445844_C0284B56 
X-CRM114-Status: GOOD (  19.99  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Przemyslaw Gaj <pgaj@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

On Mon, 11 Nov 2019 12:30:45 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> Hi Boris and Przemek,
> 
> I have a working version for tests purposes. Yet, I have some basic TODOS 
> to address during the takeover of the bus.

Okay. Would you mind sharing a branch with this material so Przemek and
I can have a look at it?

> 
> I don't know if you are aware but the secondary master feature 
> description was improved for the spec v1.1 and it makes sense to take a 
> look on that.

Unfortunately I don't have access to non-public specs, but I guess
Przemek has access to it. Any specific details you want to share
regarding secondary master/mastership handover in v1.1?

> 
> Regarding the current approach (at least last Patch series and what I 
> did) I still don't know if it is the best solution.

That's exactly what we're trying to sort out :-).

> I remember in the beginning of secondary master support I discuss with 
> Boris about USB OTG vs I2C slave mode and now having a better 
> understanding how USB OTG works I think we should address secondary 
> master in a similar way.

I don't remember mentioning OTG. I did mention the USB gadget model
which I thought was a good approach for the I3C slave feature, but
AFAICT, OTG is quite different from the I3C mastership handover
mechanism. Master/slave selection in OTG is based on a pin (ID pin
IIRC), and AFAIR the device can't change role dynamically (it has to be
unplugged). Can you be more specific about what you think should be
taken from the OTG approach?

> At least for me it seems to be more modular and 
> ease to expand.

I keep thinking we won't be able to address both things at the same
time. As I said many times, I3C slave support sounds orthogonal to the
I3C mastership handover bits. I know the master acts as a 'slave' when
it doesn't own the bus, but it's a rather specific slave profile (at
least if the secondary master only implements the master profile) where
only MR events can be sent/received. I don't think we should expose it
as an I3C slave (or gadget if we make an analogy with the USB subsystem)
in that case.

Can we please focus on I3C mastership handover here, and put I3C slave
support on the side. BTW, if you have a draft for the I3C slave
framework, don't hesitate to post it, that's something we can review in
parallel.

Regards,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
