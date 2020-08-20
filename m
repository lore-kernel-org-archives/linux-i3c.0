Return-Path: <SRS0=korR=B6=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AD7C433DF
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Aug 2020 19:18:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A19206DA
	for <linux-i3c@archiver.kernel.org>; Thu, 20 Aug 2020 19:18:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dSYqy3bO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93A19206DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fTnK+rXxDLW1CWqAznOrQHGEAmJgltx61mV5+rtbWYo=; b=dSYqy3bOVGidT+j90Z4q3kVlZ
	f2f0lhR7QqbakrMYU9oKTvADLDRN1nzF/MTbU+uZuNhlxBq0CtqXUNRcdHibmpRHFxJ+IyHD9nhnV
	q4P5aCmMHVzo4OpQUwz7wKUQ7InZ7yNz9M97S7UR/3Px1D9Pcfn9OLiBGLLyTyFh/DnoO55RMx9Qp
	7AKWpy6SAN0jbhfTH5BIyX5DAPfE8boADAfWyPhFVxWGNt9oz5OF2XfxbfW5LVHvxoRVcdt0QJRF2
	FWcz56bQRlihhyA8u7mcm3j8TKOtJTdE8qdKvUJZSf5YVr60xNWHGUNuVRBLSLKlx6bOc0UfVCgDV
	wav6dpdww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8q5G-0001pp-KU
	for linux-i3c@archiver.kernel.org; Thu, 20 Aug 2020 19:18:46 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8q5E-0001pU-1J
 for linux-i3c@lists.infradead.org; Thu, 20 Aug 2020 19:18:44 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A797C29AC9B;
 Thu, 20 Aug 2020 20:18:42 +0100 (BST)
Date: Thu, 20 Aug 2020 21:18:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Parshuram Raju Thombare <pthombar@cadence.com>
Subject: Re: [PATCH v3] i3c: master: fix for SETDASA and DAA process
Message-ID: <20200820211839.54a42cf6@collabora.com>
In-Reply-To: <20200820210311.5934fc2a@collabora.com>
References: <1597930706-15744-1-git-send-email-pthombar@cadence.com>
 <20200820164820.4fec97b3@collabora.com>
 <DM5PR07MB3196085F8628478E7E2F5FC8C15A0@DM5PR07MB3196.namprd07.prod.outlook.com>
 <20200820210311.5934fc2a@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_151844_220073_DB7355A8 
X-CRM114-Status: GOOD (  34.24  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Milind Parab <mparab@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "praneeth@ti.com" <praneeth@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "vitor.soares@synopsys.com" <vitor.soares@synopsys.com>,
 Przemyslaw Gaj <pgaj@cadence.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 20 Aug 2020 21:03:11 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 20 Aug 2020 18:16:14 +0000
> Parshuram Raju Thombare <pthombar@cadence.com> wrote:
> 
> > >Hm, not sure that qualifies as a fix. The current implementation was
> > >correct, it was just reserving a slot in the device table for devices
> > >that didn't have an init address or on which SETDASA failed.    
> > If I3C controllers like ours use hardware slots to store slave devices info, 
> > due to limited available slots this can cause issue. 
> >  If some slots are lost due to
> > 1. only init_dyn_addr and no static_addr in DT 
> > OR
> > 2. SETDASA failed  
> 
> Well, having a slot with a static address is valid, though I agree
> it's not really useful.
> 
> > at the end of DAA some devices may be left without dyn_addr allocated from master
> > and hence can't work properly.  
> 
> My point is, there's no address or device slot leak, it's just that
> reserving a slot for I3C devices that only have a static address is
> kind of useless. But let's be honest, given the number of I3C devices
> available out there, I don't think it will hurt us before quite some
> time :P. That's not to say we shouldn't address that, I just don't
> think it deserves a Fixes tag.
> 
> > I think during our discussion we recognized this change as a bug.  
> 
> IIRC, I was talking about the first patch in the series.
> 
> > That is the reason I added fixes tag, but if you think otherwise I can remove this tag.
> >    
> > >> -static void i3c_master_pre_assign_dyn_addr(struct i3c_dev_desc *dev)
> > >> +static int i3c_master_pre_assign_dyn_addr(struct i3c_master_controller    
> > >That function now does more than just assigning a dynamic address: it
> > >also creates the i3c_dev_desc. It should be renamed accordingly
> > >(i3c_master_early_i3c_dev_add() maybe).    
> > Ok
> >   
> > >You should reserve the address before calling
> > >i3c_master_pre_assign_dyn_addr():
> > >
> > >		/*
> > >		 * We don't attach devices which are not addressable
> > >		 * (no static_addr and dyn_addr) and devices with
> > >		 * static_addr but no init_dyn_addr will participate in DAA.
> > >		 */
> > >		if (!i3cboardinfo->init_dyn_addr ||
> > >		    !i3cboardinfo->static_addr)
> > >			continue;    
> > Don't we want to cover the case when only init_dyn_addr is present ?  
> 
> Uh, yes, my bad.
> 
> > I am not sure if we can't have init_dyn_addr without static_addr.  
> 
> You can, when you want to assign a specific dynamic address to a device
> that doesn't have a static address (see the 'try to assign init_addr
> dance' in i3c_dev_add()).
> 
> > May be what we need is 
> > 		if (!i3cboardinfo->init_dyn_addr)
> > 			continue;
> > 
> > 		ret = i3c_bus_get_addr_slot_status(&master->bus,
> > 						   i3cboardinfo->init_dyn_addr);
> > 		if (ret != I3C_ADDR_SLOT_FREE) {
> > 			ret = -EBUSY;
> > 			goto err_rstdaa;
> > 		}
> > 
> > 		i3c_bus_set_addr_slot_status(&master->bus,
> > 					     i3cboardinfo->init_dyn_addr,
> > 					     I3C_ADDR_SLOT_I3C_DEV);
> > 
> > 		if (i3cboardinfo->static_addr)
> > 			i3c_master_pre_assign_dyn_addr(master, i3cboardinfo);  
> 
> Yep, that's correct.
> 
> > IMHO this is functionally same to what I sent. Just that init_dyn_addr is reserved before,
> > and we leverage the change in reattach to bypass failure due to second attempt
> > to get init_dyn_addr in reattach called from i3c_master_pre_assign_dyn_addr().  
> 
> Unless I'm missing something, your solution didn't reserve the
> init address when there's no static address, and we definitely want
> that to happen, otherwise another device might steal it during DAA.

My bad, it did. This being said, I find it much easier to follow when
the reservation happens in one place, so I'm still in favor of the new
version.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
