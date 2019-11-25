Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EC7C43215
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 13:09:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79B2A20836
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 13:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DYgGuriG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79B2A20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oKgnRV54FoRlguFCZ0WWGQeHMSVBKKyhwOSG5UG9qqI=; b=DYgGuriGlkq5g/
	cCgXEW6dbQE6MdGBLUZASNfU/dw71/dLkyI61pQmcmv7ktq+vUrgXZWqhijfc+059A+bu/CjuF64E
	XOVOToxEqFLG+U7DHCp0/Ec9rkEnfwbGNq+eNq/zRPBH6TOKrPs6tWrCeEw3ICL6N7uwm8T9TI7Zy
	jCcRb/PxSMs8LIJnh5yMN8s1mtUronS+S6Quk1TDHKrl2yzKf3NOA+ymfvGvAAs5UH2Jdqd9+HVYk
	LVrt+AG5A3YUaDOxpu/abnjd+K7vg0C/40dKVZQUxJfoW0DGfWy5k4ObKZuyuFfxF6/f3EtYAzvj7
	W32Pflx2IcvuvmuXHBug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZE7h-00087F-5M; Mon, 25 Nov 2019 13:09:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZE7c-00086X-MB
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 13:09:47 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7223B28FD16;
 Mon, 25 Nov 2019 13:09:41 +0000 (GMT)
Date: Mon, 25 Nov 2019 14:09:36 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: I3C Mastership RFC
Message-ID: <20191125140936.47f3d479@collabora.com>
In-Reply-To: <CH2PR12MB421644B0CAB1DEF50675995EAE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125123452.7c2549dd@collabora.com>
 <CH2PR12MB42168C76A833F1401A597E65AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125115502.GA5777@global.cadence.com>
 <CH2PR12MB421667CED7F6A5FF0299E732AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125132219.2e45d084@collabora.com>
 <CH2PR12MB421644B0CAB1DEF50675995EAE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_050944_984092_71047432 
X-CRM114-Status: GOOD (  18.85  )
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
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Mon, 25 Nov 2019 13:00:17 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> > > > > > I'm pretty sure we solved that already (that's what
> > > > > > i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> > > > > > Can you be a bit more specific? What makes you think the master might
> > > > > > not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> > > > > > called?    
> > > > > 
> > > > > You are assuming that after i3c_master_acquire_bus_ownership() return, 
> > > > > secondary master already owns the bus. Main master can ack the MR request 
> > > > > and not send the CETACCMST immediately.
> > > > >    
> > > > 
> > > > In Cadence HC driver, I'm waiting for GETACCMST longer, polling the
> > > > status and after I exit from ->request_mastership(), I'm the bus owner.
> > > > If not, error exit code is returned and we can't make the transfers.
> > > > Are you able to implement the same behavior?    
> > > 
> > > You can assume everyone will do in that way. What happen if you receive a 
> > > request or an information from current master?  
> > 
> > We have this ->request_mastership() method so controllers that have
> > this logic (MR+wait(GETACCMST) automated can still interface with the
> > subsystem.   
> 
> I can also poll the GETACCMST but we are assuming nothing will happen 
> between MR and GETACCMST.

Nothing coming from the master that tries to acquire the bus, yes.
Nothing coming from the current master, no, and that shouldn't be a
problem as long as those operations don't involve acquiring bus->lock.
And if some of those operation involve acquiring the lock (I'd still
need to understand which operation that would be) they'll just be
delayed/rejected.

> 
> > If your controller handles the MR/GETACCMST separately, it
> > shouldn't be hard to implement, and we can even provide an helper if
> > people end up duplicating the code.  
> 
> I already implement a callback in my code so each controller be able to 
> do their stuff in that in request/deliver mastership.

Can you share some details here? What would those callbacks supposed to
do and when would they be called?

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
