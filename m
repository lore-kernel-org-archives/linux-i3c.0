Return-Path: <SRS0=0Lh8=WZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9935FC3A5A3
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 15:37:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D75B21726
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 15:37:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H6eL55SO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D75B21726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6XQ2+60c+FFEq2fd6wQUujtNEJ5wA/ps0m1RzaOmKug=; b=H6eL55SOlCiP6Z
	dtJqtOiXExLxKteH/5G0u0eW8rU9ReiqrudcoFXWVtjxhy/ob30nEV7+QKwKfXM+zN7N9ZbXtf+lz
	Vz8mj1US/P8u8dke4l5K/dsbgjN88fmiEYOHItQptbt5sYJYmhQxmHI55wGHgrAnjhyFyu5Z4TRRA
	i9Yr+LlwPnMvRu5wcJMdjuBE5EEx9gmTQb7bFmzf5/5lMetwbhU9MQpG6Zgrft+D1bN6Mrur+ov6G
	QUtQyv78BqKaEXYzF4YyDAXvAH6Noa4NEIv6rMNH4z8cTpGKhZ2uaSKPzXaP2uCOsS4Hw5oZGJOeN
	RZ9OYXrdl5WLa90+EBaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MUG-0005lE-Hw; Thu, 29 Aug 2019 15:37:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MUA-0005kP-42
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 15:37:22 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id CC30F283C49;
 Thu, 29 Aug 2019 16:37:13 +0100 (BST)
Date: Thu, 29 Aug 2019 17:37:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH 1/4] i3c: master: detach and free device if
 pre_assign_dyn_addr() fails
Message-ID: <20190829173709.79c093dd@collabora.com>
In-Reply-To: <SN6PR12MB2655E9E544D7E96323BAC796AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
 <e26948eaaf765f683d8fe0618a31a98e2ecc0e65.1567071213.git.vitor.soares@synopsys.com>
 <20190829124115.482cd8ec@collabora.com>
 <SN6PR12MB26551F172804D039F3EAA991AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190829163520.126d42d6@collabora.com>
 <SN6PR12MB2655E9E544D7E96323BAC796AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_083718_891932_E1326711 
X-CRM114-Status: GOOD (  30.94  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Przemyslaw Gaj <pgaj@cadence.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 29 Aug 2019 15:23:30 +0000
Vitor Soares <Vitor.Soares@synopsys.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> Date: Thu, Aug 29, 2019 at 15:35:20
> 
> > On Thu, 29 Aug 2019 13:53:24 +0000
> > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> >   
> > > Hi Boris,
> > > 
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > Date: Thu, Aug 29, 2019 at 11:41:15
> > >   
> > > > +Przemek
> > > > 
> > > > Please try to Cc active I3C contributors so they get a chance to
> > > > comment on your patches.    
> > > 
> > > I can do that next time.
> > >   
> > > > 
> > > > On Thu, 29 Aug 2019 12:19:32 +0200
> > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > >     
> > > > > On pre_assing_dyn_addr() the devices that fail:
> > > > >   i3c_master_setdasa_locked()
> > > > >   i3c_master_reattach_i3c_dev()
> > > > >   i3c_master_retrieve_dev_info()
> > > > > 
> > > > > are kept in memory and master->bus.devs list. This makes the i3c devices
> > > > > without a dynamic address are sent on DEFSLVS CCC command. Fix this by
> > > > > detaching and freeing the devices that fail on pre_assign_dyn_addr().    
> > > > 
> > > > I don't think removing those entries is a good strategy, as one might
> > > > want to try to use a different dynamic address if the requested one
> > > > is not available.    
> > > 
> > > Do you mean same 'assigned-address' attribute in DT?  
> > 
> > Yes, or say it's another device that got the address we want and this
> > device doesn't want to release the address (I'm assuming the !SA case).
> >   
> > > 
> > > If so, it is checked here:
> > > 
> > > static int i3c_master_bus_init(struct i3c_master_controller *master)
> > > ...
> > > 	list_for_each_entry(i3cboardinfo, &master->boardinfo.i3c, node) {
> > > 		struct i3c_device_info info = {
> > > 			.static_addr = i3cboardinfo->static_addr,
> > > 		};
> > > 
> > > 		if (i3cboardinfo->init_dyn_addr) {
> > > 			status = i3c_bus_get_addr_slot_status(&master->bus,
> > > 			^
> > > 						i3cboardinfo->init_dyn_addr);
> > > 			if (status != I3C_ADDR_SLOT_FREE) {
> > > 				ret = -EBUSY;
> > > 				goto err_detach_devs;
> > > 			}
> > > 		}
> > > 
> > > 		i3cdev = i3c_master_alloc_i3c_dev(master, &info);
> > > 		if (IS_ERR(i3cdev)) {
> > > 			ret = PTR_ERR(i3cdev);
> > > 			goto err_detach_devs;
> > > 		}
> > > 
> > > 		i3cdev->boardinfo = i3cboardinfo;
> > > 
> > > 		ret = i3c_master_attach_i3c_dev(master, i3cdev);
> > > 		if (ret) {
> > > 			i3c_master_free_i3c_dev(i3cdev);
> > > 			goto err_detach_devs;
> > > 		}
> > > 	}
> > > ...
> > > 
> > > and later if it fails i3c_master_pre_assign_dyn_addr(), the device can 
> > > participate in Enter Dynamic Address Assignment process.
> > > I may need to check the boardinfo->init_dyn_addr status on 
> > > i3c_master_add_i3c_dev_locked before i3c_master_setnewda_locked().  
> > 
> > I need to double check but I thought we were already handling that case
> > properly.  
> 
> Yes, it is handled in the code above.

No, I meant the 'assign init_dyn_addr even if !SA', and the code I
pointed in my other reply tends to confirm that this is something we
already take into account (maybe not correctly, but the code is here).

> 
> >   
> > >   
> > > > Why not simply skipping entries that have ->dyn_addr
> > > > set to 0 when preparing a DEFSLVS frame    
> > > 
> > > I considered that solution too but if the device isn't enumerated why 
> > > should it be attached and kept in memory?  
> > 
> > Might be a device that supports HJ, and in that case we might want the
> > controller to reserve a slot in its device table for that device.
> > Anyway, it doesn't hurt to have it around as long as we don't pass the
> > device through DEFSLVS if it doesn't have a dynamic address. I really
> > prefer to keep the logic unchanged and fix it if it needs to be fixed.  
> 
> Well, we aren't reserving a slot because we need another one to attach 
> the device when it is enumerated and hence a device may be using 2 slots 
> in the controller.

Right, you shouldn't reserve a slot when ->static_address == 0 &&
->dynamic_address == 0, but I still don't see where the problem is with
the solution we have right now, sorry. Note that even if you reserve a
slot in that case, the device only occupies 2 slots for a short amount
of time, because the add_i3c_dev() logic will detect that the descriptor
already exists and reattach the device with its new address.

> It may cause problems in HC with reduced slots and it is another reason 
> why I think we should detach device without dynamic address after the 
> enumeration phase.

Can you please try the approach I suggest? => fix the existing logic to
make it work without this "free undiscovered dev desc, reallocate later"
dance.

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
