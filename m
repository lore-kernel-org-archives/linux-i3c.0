Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9809C282EC
	for <linux-i3c@archiver.kernel.org>; Mon, 17 Mar 2025 17:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5HME8OV8nCoh/1KLRUHtajpjrk3ptbwsKRnmIyLS5N4=; b=gUuoT/oUWBqEfj
	w61X7TBt1kINAxDeTeyjf8q0M6HEMxMPopRNVVJh5QMlAIWldatfbwdS6J4tj1G+n1jtMUjuLSXOM
	OGFGkaK8NIl2feVprHYIVfLkbDA+fkekcAY1DbGi5TIKKEhX7bt8LdMUWwTwjVhYUFVsv3NU45lQv
	1uqWaQOtkvHHMLKgxRN6f2sIt1rp8enAD2N6GRsqF8LEdPGOlIJdWON/GIYYmMDW3sJQFv0dnvN+p
	BSQ3I71SNS4170I03R50ieG4ewc+uGS1Kfef4n8x1hhZNpdn1PilqWOc+ZzAQbLBLCS3zW/L620o0
	+GEiJHnNcNsrybYdmfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuER2-00000003Zt1-2Q1v;
	Mon, 17 Mar 2025 17:39:32 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEQy-00000003ZsX-3ESb
	for linux-i3c@lists.infradead.org;
	Mon, 17 Mar 2025 17:39:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AEF1B4453A;
	Mon, 17 Mar 2025 17:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742233163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2aP9JOjwWHmiPktb3zwtlZkjkfIxkDiir2T4v3t/MYY=;
	b=JaS2+V42vHbaAEt9KhQ0pC7pdk8jC7/iFFjcZr2FQxv/E7C8fRGMHaWicimiCmC3A10MyP
	AVRf17VDgtxGjGv5RHyzbbEKnxxKiA89geI6BAqQhPji3f/gilLDisQ2VSW+ixyUHz1XZr
	75GzLn4YGtGA0LMZdmKEb10RaYxo+//ZrqvdXYa9xuqFisrnOgf+92/Pz2EeS6wse/EoSE
	ueZQ0ehLespuz89f9NO6bB3n5HIUjUMJuSXJGXAU2t5oMJ5kKXYWGtm7BLvCWrKEuL9kY0
	RGYdCT3kMF7tXfbfuK8UEtyt7gdpVSY01Xv6oUDaa4eoZqSFhbKcJm2cretbhg==
Date: Mon, 17 Mar 2025 18:39:22 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
Cc: Frank Li <frank.li@nxp.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"conor.culhane@silvaco.com" <conor.culhane@silvaco.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	"rvmanjumce@gmail.com" <rvmanjumce@gmail.com>
Subject: Re: [PATCH v4] svc-i3c-master: Fix read from unreadable memory at
 svc_i3c_master_ibi_work()
Message-ID: <2025031717392264f19f1a@mail.local>
References: <20250312135356.2318667-1-manjunatha.venkatesh@nxp.com>
 <Z9HSdtD1CkdCpGu9@lizhi-Precision-Tower-5810>
 <VI1PR04MB10049644F3287C378E9CC75EF8FD32@VI1PR04MB10049.eurprd04.prod.outlook.com>
 <Z9gjGYudiYyl3bSe@lizhi-Precision-Tower-5810>
 <VI1PR04MB1004979B7D38486FD1E1CC8508FDF2@VI1PR04MB10049.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR04MB1004979B7D38486FD1E1CC8508FDF2@VI1PR04MB10049.eurprd04.prod.outlook.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedtudegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddtgfeuvedtheejtdethfdthfegfeelvdelffdtudevjeehieekgfekheevledunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpihhnfhhrrgguvggrugdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepmhgrnhhjuhhnrghthhgrrdhvvghnkhgrthgvshhhsehngihprdgtohhmpdhrtghpthhtohepfhhrrghnk
 hdrlhhisehngihprdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtohhnohhrrdgtuhhlhhgrnhgvsehsihhlvhgrtghordgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehsthgrsghlvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehrvhhmrghnjhhumhgtvgesghhmrghilhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_103929_422917_7009C435 
X-CRM114-Status: GOOD (  42.80  )
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

On 17/03/2025 15:46:52+0000, Manjunatha Venkatesh wrote:
> 
> 
> > -----Original Message-----
> > From: Frank Li <frank.li@nxp.com>
> > Sent: Monday, March 17, 2025 6:57 PM
> > To: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
> > Cc: miquel.raynal@bootlin.com; conor.culhane@silvaco.com;
> > alexandre.belloni@bootlin.com; linux-i3c@lists.infradead.org; linux-
> > kernel@vger.kernel.org; stable@vger.kernel.org; rvmanjumce@gmail.com
> > Subject: Re: [PATCH v4] svc-i3c-master: Fix read from unreadable memory at
> > svc_i3c_master_ibi_work()
> > 
> > On Thu, Mar 13, 2025 at 05:15:42AM +0000, Manjunatha Venkatesh wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Frank Li <frank.li@nxp.com>
> > > > Sent: Wednesday, March 12, 2025 11:59 PM
> > > > To: Manjunatha Venkatesh <manjunatha.venkatesh@nxp.com>
> > > > Cc: miquel.raynal@bootlin.com; conor.culhane@silvaco.com;
> > > > alexandre.belloni@bootlin.com; linux-i3c@lists.infradead.org; linux-
> > > > kernel@vger.kernel.org; stable@vger.kernel.org; rvmanjumce@gmail.com
> > > > Subject: Re: [PATCH v4] svc-i3c-master: Fix read from unreadable
> > > > memory at
> > > > svc_i3c_master_ibi_work()
> > > >
> > > > On Wed, Mar 12, 2025 at 07:23:56PM +0530, Manjunatha Venkatesh
> > wrote:
> > > > > As part of I3C driver probing sequence for particular device
> > > > > instance, While adding to queue it is trying to access ibi
> > > > > variable of dev which is not yet initialized causing "Unable to
> > > > > handle kernel read from unreadable memory" resulting in kernel panic.
> > > > >
> > > > > Below is the sequence where this issue happened.
> > > > > 1. During boot up sequence IBI is received at host  from the slave device
> > > > >    before requesting for IBI, Usually will request IBI by calling
> > > > >    i3c_device_request_ibi() during probe of slave driver.
> > > > > 2. Since master code trying to access IBI Variable for the particular
> > > > >    device instance before actually it initialized by slave driver,
> > > > >    due to this randomly accessing the address and causing kernel panic.
> > > > > 3. i3c_device_request_ibi() function invoked by the slave driver where
> > > > >    dev->ibi = ibi; assigned as part of function call
> > > > >    i3c_dev_request_ibi_locked().
> > > > > 4. But when IBI request sent by slave device, master code  trying to
> > access
> > > > >    this variable before its initialized due to this race condition
> > > > >    situation kernel panic happened.
> > > > >
> > > > > Fixes: dd3c52846d595 ("i3c: master: svc: Add Silvaco I3C master
> > > > > driver")
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Manjunatha Venkatesh
> > <manjunatha.venkatesh@nxp.com>
> > > > > ---
> > > > > Changes since v3:
> > > > >   - Description  updated typo "Fixes:"
> > > > >
> > > > >  drivers/i3c/master/svc-i3c-master.c | 7 +++++--
> > > > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/i3c/master/svc-i3c-master.c
> > > > > b/drivers/i3c/master/svc-i3c-master.c
> > > > > index d6057d8c7dec..98c4d2e5cd8d 100644
> > > > > --- a/drivers/i3c/master/svc-i3c-master.c
> > > > > +++ b/drivers/i3c/master/svc-i3c-master.c
> > > > > @@ -534,8 +534,11 @@ static void svc_i3c_master_ibi_work(struct
> > > > work_struct *work)
> > > > >  	switch (ibitype) {
> > > > >  	case SVC_I3C_MSTATUS_IBITYPE_IBI:
> > > > >  		if (dev) {
> > > > > -			i3c_master_queue_ibi(dev, master->ibi.tbq_slot);
> > > > > -			master->ibi.tbq_slot = NULL;
> > > > > +			data = i3c_dev_get_master_data(dev);
> > > > > +			if (master->ibi.slots[data->ibi]) {
> > > > > +				i3c_master_queue_ibi(dev, master-
> > > > >ibi.tbq_slot);
> > > > > +				master->ibi.tbq_slot = NULL;
> > > > > +			}
> > > >
> > > > You still not reply previous discussion:
> > > >
> > > > https://lore.kernel.org/linux-i3c/Z8sOKZSjHeeP2mY5@lizhi-Precision-T
> > > > ower-
> > > > 5810/T/#mfd02d6ddca0a4b57bc823dcbfa7571c564800417
> > > >
> > > [Manjunatha Venkatesh] : In the last mail answered to this question.
> > >
> > > > This is not issue only at svc driver, which should be common problem
> > > > for other master controller drivers
> > > >
> > > [Manjunatha Venkatesh] :Yes, you are right.
> > > One of my project I3C interface is required, where we have used IMX board
> > as reference platform.
> > > As part of boot sequence we come across this issue and tried to fix that
> > particular controller driver.
> > >
> > > What is your conclusion on this? Is it not ok to take patch for SVC alone?
> > 
> > I perfer fix at common framwork to avoid every driver copy the similar logic
> > code.
> > 
> [Manjunatha Venkatesh] : As per your suggestion tried the below patch at common framework api i3c_master_queue_ibi()
>  and looks working fine, didn't see any crash issue.
> if (!dev->ibi || !slot) {
>              dev_warning("...");

Do we really need a warning, what would be the user action after seeing
it?
>              return;
> }
> Will commit this change in next patch submission.
> 
> > Frank
> > 
> > >
> > > > Frank
> > > >
> > > > >  		}
> > > > >  		svc_i3c_master_emit_stop(master);
> > > > >  		break;
> > > > > --
> > > > > 2.46.1
> > > > >
> > >
> > > --
> > > linux-i3c mailing list
> > > linux-i3c@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
