Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A14C46467
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Jan 2023 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjT8OWINNM35T9ifFDTzyUiLymvNnPocPM2TUTLC7to=; b=DPWQH1cml+LBTB
	oZE69hjDkHnWDbknY6glmy64uN7WAT4O/xDsvjeBzLSHgbX1v5YWRvCmgX68/J65ICMFb8wy/8NvS
	mcFb1kLS1/8H1VciiHMz7ML5ILA8qNTGzda+1OFtXRluw/ssMkObsZeLtUuHR/MDpyga7fh5CIFVj
	y4GXMo5sPl20K6iA+2PZrlbSPmYmSqx7ckMTqC1KCZ7Kryc4njphpVCzLU0ilpiorWajx+csMQydU
	T3cIJk7u+hG8ETtR25nyv74wNLiMKfeyrx3f7nXQsAEgKA5Ir9xrxqfb/sUeNp+EiNdtpsGKETfrg
	tCwJWXQgusFiZp4dR0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbEL-00BbgS-TH; Wed, 11 Jan 2023 13:33:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXmA-00AdTM-OE
	for linux-i3c@lists.infradead.org; Wed, 11 Jan 2023 09:52:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D29B161B36;
	Wed, 11 Jan 2023 09:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55437C433EF;
	Wed, 11 Jan 2023 09:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673430725;
	bh=oXCi5khh0tLaMHH1zP2nsRJNVvEQa1Cgs0JsEGf4KV0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gPuguIzzFo6WwvkmvdXCcucIdg/z4oenZaHNqVwe0Xv8BUYanHPNMhHieoI3sdeN0
	 AsWCf9aLt5wvj+I3NsaGNl6FBV3WWFApXe5DcEO4yauxcgGRjc0UG8e3RtVz8QmvQT
	 AEf0sLnzE201I52A5gl+CjVi5n2RuHLZHKH8WrHs=
Date: Wed, 11 Jan 2023 10:52:02 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Wolfram Sang <wsa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sean Young <sean@mess.org>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>, Ming Lei <ming.lei@redhat.com>,
	Jilin Yuan <yuanjilin@cdjrlc.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Won Chung <wonchung@google.com>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-block@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux1394-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/5] driver core: make struct device_type.uevent() take a
 const *
Message-ID: <Y76Gwna0pihXYQwU@kroah.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <20221125115618.14ef8167@sal.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125115618.14ef8167@sal.lan>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_015206_834202_E79EE136 
X-CRM114-Status: GOOD (  14.95  )
X-Mailman-Approved-At: Wed, 11 Jan 2023 05:33:24 -0800
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

On Fri, Nov 25, 2022 at 11:56:18AM +0000, Mauro Carvalho Chehab wrote:
> Em Wed, 23 Nov 2022 13:25:21 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> escreveu:
> 
> > The uevent() callback in struct device_type should not be modifying the
> > device that is passed into it, so mark it as a const * and propagate the
> > function signature changes out into all relevant subsystems that use
> > this callback.
> 
> Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Thanks for the review.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
