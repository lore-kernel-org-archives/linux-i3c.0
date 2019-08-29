Return-Path: <SRS0=0Lh8=WZ=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 407B0C3A59F
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 14:39:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1639523428
	for <linux-i3c@archiver.kernel.org>; Thu, 29 Aug 2019 14:39:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LQ28EA/N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1639523428
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tSTI5Js7XqHO4ebUkTVHTucCTj0Cm/5dFY4HfCAxQ8Y=; b=LQ28EA/NR/zBEk
	t/gInLVNxPWDRkPky2fPW4O4oYkeC08Rl7eX2ah6/LjWEw/MNl6gqrnU/tnDSTMt0C5OhzmNSLpU/
	HmDb7m9bxx/mln3ZFnW9shUlnQXEi3jymiGfqzrrjgozWXh5+qiIrJa6itOAWUgzfGHPW1VxX7R8k
	QOXuLwRoKAtywUh8xWQj8UWjUL7Nh4gUNRhGKaPgc+Lw9Z4YAgScVjvu1OtzwmX4RG0utM9La2Lto
	d4wU/AaEmJOp9H8RqfjlMZIv5BTmNi4Hf9zOgeny27cm/y9Mnd/SCjNOnqy6HcHfRJ+T0ROsZ3VaV
	kwaHJ2gfXfV15hBFk/cQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3LaY-0008In-DC; Thu, 29 Aug 2019 14:39:52 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3LaT-0008H1-JR
 for linux-i3c@lists.infradead.org; Thu, 29 Aug 2019 14:39:49 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 45BD028A16C;
 Thu, 29 Aug 2019 15:39:44 +0100 (BST)
Date: Thu, 29 Aug 2019 16:39:41 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: Re: [PATCH 2/4] i3c: master: Check if devices have
 i3c_dev_boardinfo on i3c_master_add_i3c_dev_locked()
Message-ID: <20190829163941.45380b19@collabora.com>
In-Reply-To: <20190829163918.571fd0d8@collabora.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
 <3e21481ddf53ea58f5899df6ec542b79b8cbcd68.1567071213.git.vitor.soares@synopsys.com>
 <20190829124457.3a750932@collabora.com>
 <SN6PR12MB265551F73B9B516CACB5B807AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190829163918.571fd0d8@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_073946_337181_63E0E163 
X-CRM114-Status: GOOD (  16.02  )
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
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, 29 Aug 2019 16:39:18 +0200
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 29 Aug 2019 14:00:44 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > Hi Boris,
> > 
> > From: Boris Brezillon <boris.brezillon@collabora.com>
> > Date: Thu, Aug 29, 2019 at 11:44:57
> >   
> > > On Thu, 29 Aug 2019 12:19:33 +0200
> > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > >     
> > > > The I3C devices described in DT might not be attached to the master which
> > > > doesn't allow to assign a specific dynamic address.    
> > > 
> > > I remember testing this when developing the framework, so, unless
> > > another patch regressed it, it should already work. I suspect patch 1
> > > is actually the regressing this use case.    
> > 
> > For today it doesn't address the case where the device is described with 
> > static address = 0, which isn't attached to the controller.  
> 
> Hm, I'm pretty sure I had designed the code to support that case (see
> [1]). It might be buggy, but nothing we can't fix I guess.
> 

[1]https://elixir.bootlin.com/linux/v5.3-rc6/source/drivers/i3c/master.c#L1898

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
