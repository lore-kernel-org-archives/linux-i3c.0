Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FC7C5479D
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Jan 2023 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=54xqbCntbSjgaucGWy0bhvMAfoHa2QX52f7xRilm5mg=; b=Ai06P2w1H6zYN6
	Wlu77HhtggnWJ5QhDNXYA4KSurL1a/8LJTJoeRvTd/Y5Yva04w/zy3Onaf0G5DRh2GpbrS0Sq2AJd
	6b9DSnxeF7uN5JAaNHPaYQHM4dEdYK+01q8IktReshIlfR9LLQcNupAYs2nM3aARfG+pgOwMfyYvR
	lyMjuup4biR6hmi/nfkwpbBbfWX7Av+JePQRA7QYj6Zj1Vv6Dg1sgaP1tW5LoTvOY32wJ9I/ZTo++
	JVe6mCXMGkPqNELaY1XcBPwPPtIAgDv0pIlamasWUCr05iJi1SVVWXKhK5FFSRwMv4P3dPsd/urq8
	hIFZp5zcJIsSU0whz1zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFbEL-00Bbg4-Ds; Wed, 11 Jan 2023 13:33:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXlW-00AdHV-9K
	for linux-i3c@lists.infradead.org; Wed, 11 Jan 2023 09:51:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 756AF61B8A;
	Wed, 11 Jan 2023 09:51:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F6DC433F1;
	Wed, 11 Jan 2023 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1673430685;
	bh=z0ZYgHqL1YLvYl+ue5zNy1KMy+u3shk6BmiAvHiQZSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xZGcZ5JDRrdXTJbt9tLPDzh24ToBaCeG04aIrg63SxaV0mqioT6pGZXGHiVeh9ZOU
	 sO0JuLfJTFUVrJVMPgoU9Fwio7tkoa1uh4VeY/xzIKAbqvAAsfPDw+kuuk3E42lxBv
	 sJ9yu85to26aoTWWeVLBJDsI3mtwYFGQ3RchmYyA=
Date: Wed, 11 Jan 2023 10:51:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	Len Brown <lenb@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Wolfram Sang <wsa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <Y76GmvOD9KxSuD7o@kroah.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <CAJZ5v0gqD_TW3iGLAiH=us1B0-JLGtv2VGTJjQwiWxCmris9ag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0gqD_TW3iGLAiH=us1B0-JLGtv2VGTJjQwiWxCmris9ag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_015126_463278_BC999084 
X-CRM114-Status: GOOD (  18.51  )
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

On Wed, Nov 23, 2022 at 01:38:05PM +0100, Rafael J. Wysocki wrote:
> On Wed, Nov 23, 2022 at 1:25 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > The uevent() callback in struct device_type should not be modifying the
> > device that is passed into it, so mark it as a const * and propagate the
> > function signature changes out into all relevant subsystems that use
> > this callback.
> >
> > Cc: Jens Axboe <axboe@kernel.dk>
> > Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> > Cc: Len Brown <lenb@kernel.org>
> > Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>
> > Cc: Wolfram Sang <wsa@kernel.org>
> > Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > Cc: Sean Young <sean@mess.org>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: Maximilian Luz <luzmaximilian@gmail.com>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Mark Gross <markgross@kernel.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Cc: Sanyog Kale <sanyog.r.kale@intel.com>
> > Cc: Andreas Noever <andreas.noever@gmail.com>
> > Cc: Michael Jamet <michael.jamet@intel.com>
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Yehezkel Bernat <YehezkelShB@gmail.com>
> > Cc: Jiri Slaby <jirislaby@kernel.org>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>
> > Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> > Cc: Chaitanya Kulkarni <kch@nvidia.com>
> > Cc: Ming Lei <ming.lei@redhat.com>
> > Cc: Jilin Yuan <yuanjilin@cdjrlc.com>
> > Cc: Alan Stern <stern@rowland.harvard.edu>
> > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Ira Weiny <ira.weiny@intel.com>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Won Chung <wonchung@google.com>
> > Cc: alsa-devel@alsa-project.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-acpi@vger.kernel.org
> > Cc: linux-block@vger.kernel.org
> > Cc: linux-i2c@vger.kernel.org
> > Cc: linux-i3c@lists.infradead.org
> > Cc: linux-input@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: linux-serial@vger.kernel.org
> > Cc: linux-usb@vger.kernel.org
> > Cc: linux1394-devel@lists.sourceforge.net
> > Cc: platform-driver-x86@vger.kernel.org
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> 
> (which my ACPI maintainer hat on).

thanks for the review, I'll add it to the v2 patch.

greg k-h

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
