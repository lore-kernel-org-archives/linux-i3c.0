Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CA1C282EC
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Mar 2025 22:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zHq91SoKz/TWsl58H1JMIETYiQxgJqBlsH03Dpl1U4=; b=mpipxKOa8r44x5
	85LwNz6YqyqEOs9Nq7mz4NdO2Lz+eAYM26uq6MPtjws+m1BmzADBmaeubQDr/eBGEjChdaFq6NOTz
	yc76kbO/g8qycm2Q9B89B6SfqhLHpucd5XYmWUyb6rUnYO4OpQsQK3+Az9AHpLs1C8lnFzOnFF1nE
	N4kaSXo3m0hPiXh/u7lLrg57aga5R7SVwgQiPkJcUvIBQ9LBInVmyxWYiHYyGXW8iHyq9TdnzntSW
	fmjE5CK/6T3RLdl/ElmKToG3U4ZxxpMJfPGBFpSxoUmOENSjk7woyEhtVRV+svWpibjQpqhhdkXGR
	kC7p3cRoG6aer1mAiYnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuJCQ-000000048d4-453U;
	Mon, 17 Mar 2025 22:44:46 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuJCO-000000048cc-2xrw
	for linux-i3c@lists.infradead.org;
	Mon, 17 Mar 2025 22:44:46 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 003134327A;
	Mon, 17 Mar 2025 22:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742251482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+DFeujrXddI7AipEE/U92hGOn892c6Z6ywxYR+W8kOo=;
	b=Tfs+PypCiW8O+ZQMtkwQpPVVdplJ32j+A9AbS/L54/ahVfEVwfQxYmrrPGChYvYycZbqI8
	zOjlT1VjUt+TP3vODZW5MLBDr6qJlSs7dNtoEMX+KCfnUT33Qtgsu7F3hMlJfnkkmrfLxs
	8GNKL22nEhs8D5cKLXWNQBPH+Dbc/rnqDFF4FKJ0u8g12Egkb/AYqamsAGElcc4GX4GMkD
	9IK0pYXFomv7ysuPvNwuPCfxm5Nb/12DjxvbRO/o5SIivMjcnO6uOeLwcaiiTaTknfdu2G
	HKvJHMeSQmQG+ee2keSyeeZbH41Cc/qbUCNskuDW0be9gNSpboZUVp1C6YgDCA==
Date: Mon, 17 Mar 2025 23:44:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Stanley Chu <stanley.chuys@gmail.com>, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1 1/3] i3c: master: svc: Fix missing the IBI rules
Message-ID: <20250317224440840e4117@mail.local>
References: <20250317051951.3065011-1-yschu@nuvoton.com>
 <20250317051951.3065011-2-yschu@nuvoton.com>
 <Z9glVBnpdwXuLwD7@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z9glVBnpdwXuLwD7@lizhi-Precision-Tower-5810>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtjeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepkedprhgtphhtthhopefhrhgrnhhkrdhlihesnhigphdrtghomhdprhgtphhtthhopehsthgrnhhlvgihrdgthhhuhihssehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihn
 hgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhomhgvrhdrmhgrihhmohhnsehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohepkhiflhhiuhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopeihshgthhhusehnuhhvohhtohhnrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_154444_876522_956CD710 
X-CRM114-Status: GOOD (  22.32  )
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

Hello Frank,

On 17/03/2025 09:36:20-0400, Frank Li wrote:
> On Mon, Mar 17, 2025 at 01:19:49PM +0800, Stanley Chu wrote:
> > From: Stanley Chu <yschu@nuvoton.com>
> >
> > The code does not add IBI rules for devices with controller capability.
> > However, some target devices, such as secondary controller, also have
>                 ^^ dual rule devices
> 
> OR
> 
> However, the second controller have the controller capablity and work at
> target devices mode when the device probe. So add IBI rules for such
> devices.
> 
> 
> > the controller capability.
> > Modify the code to add rules for devices capable of sending IBI requests.
> >
> > Fixes: dd3c52846d59 ("i3c: master: svc: Add Silvaco I3C master driver")
> > Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> 
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Please avoid adding you reviewed-by tag when you request changes, else
patch work will show the patch as being applicable. This is fine to do
it occasionally but not for all the patches you review. You can simply
wait for the next version to come.

> 
> 
> > ---
> >  drivers/i3c/master/svc-i3c-master.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> > index 1d1f351b9a85..a72ba5a7edd4 100644
> > --- a/drivers/i3c/master/svc-i3c-master.c
> > +++ b/drivers/i3c/master/svc-i3c-master.c
> > @@ -1106,7 +1106,7 @@ static int svc_i3c_update_ibirules(struct svc_i3c_master *master)
> >
> >  	/* Create the IBIRULES register for both cases */
> >  	i3c_bus_for_each_i3cdev(&master->base.bus, dev) {
> > -		if (I3C_BCR_DEVICE_ROLE(dev->info.bcr) == I3C_BCR_I3C_MASTER)
> > +		if (!(dev->info.bcr & I3C_BCR_IBI_REQ_CAP))
> >  			continue;
> >
> >  		if (dev->info.bcr & I3C_BCR_IBI_PAYLOAD) {
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
