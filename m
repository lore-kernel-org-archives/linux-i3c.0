Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC37BC47088
	for <linux-i3c@archiver.kernel.org>; Fri, 25 Nov 2022 21:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdXbTeCiZ+7v6rlYdUaBOMIphiDSUFfDfyAbbE0zqDI=; b=CMOuSdL1iDlH+I
	+HSJSkzorm+CtQo6CtAthnFBAg31hFHXL98SRajW027w4QBcng8F8ubxIMas/RfJRdY1i/K9S3WxL
	KptNVj1fNivPftX+USkPrCeJSXS+EscUMpc3BFxyM/9n3WKAJV9A2mz/5TCUi9oqX10TvwhnU4Dhr
	3BXTfDAkw/AgUAsmWCGsWKpOzmd6mVFi0brpFgtutvfec6yh/SrYLiseEtvdJ/Qgx3Fyiuoj2zKiF
	+0SC3H5HKZa/tv0sj+7nl/dBu7EAH6zwujb+1O1BzLcK7cXSpN3oi9ptZk8mAypEQOpeUmvf82FKp
	nLmcZw/IKodYkbHBTiZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyg8G-002E2m-TR; Fri, 25 Nov 2022 21:21:12 +0000
Received: from mga14.intel.com ([192.55.52.115])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxpum-00HHzB-6g
	for linux-i3c@lists.infradead.org; Wed, 23 Nov 2022 13:35:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669210548; x=1700746548;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0dPBcIou1yq73/ShQ5ge15FFqP86cP4E6nEb250ZlWo=;
  b=K8MhvjMX66iK9c4GqAjFhCX7Xyn63/DDegL+ZfIbz1sbSreTcxZfk/LA
   UBil6tntd45gb7N7BydbR6M0tVvu2z0A0gpnE8JDec8wZULGPqWmi5+WS
   jXGNMRrXCUlk/6bBGGjbYjzHC2y1oMxaFERHkt7pcNeh2DRlZOJ68Zpd7
   CedrUuydz+8i3mKWIIFWeVkO3+LfVttK9H4uSjR8ZHBj7lErADNeqORAT
   Y+IBfWLEPOEyRpDbl1jvMfmEr7eqTd7diWU76beGKsmxFoK4baMhIi0a6
   jxhLWRY4206g28jxLzvxNdG3WVxRzElIUADmlrOGLhsqWnWulqcouNdkE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="314100725"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="314100725"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2022 05:35:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="970863671"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; 
   d="scan'208";a="970863671"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 23 Nov 2022 05:35:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oxptw-00GImp-12;
	Wed, 23 Nov 2022 15:34:56 +0200
Date: Wed, 23 Nov 2022 15:34:56 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Stefan Richter <stefanr@s5r6.in-berlin.de>,
	Wolfram Sang <wsa@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
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
Message-ID: <Y34hgIW8p1RlQTBB@smile.fi.intel.com>
References: <20221123122523.1332370-1-gregkh@linuxfoundation.org>
 <20221123122523.1332370-3-gregkh@linuxfoundation.org>
 <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <711d5275-7e80-c00d-0cdc-0f3d52175361@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_053548_287436_86D8CDD3 
X-CRM114-Status: GOOD (  20.36  )
X-Mailman-Approved-At: Fri, 25 Nov 2022 13:21:10 -0800
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

On Wed, Nov 23, 2022 at 02:14:31PM +0100, Maximilian Luz wrote:
> On 11/23/22 13:25, Greg Kroah-Hartman wrote:
> > The uevent() callback in struct device_type should not be modifying the
> > device that is passed into it, so mark it as a const * and propagate the
> > function signature changes out into all relevant subsystems that use
> > this callback.

[...]

> > -static inline struct ssam_device *to_ssam_device(struct device *d)
> > +static inline struct ssam_device *to_ssam_device(const struct device *d)
> >   {
> >   	return container_of(d, struct ssam_device, dev);
> >   }
> 
> I am slightly conflicted about this change as that now more or less
> implicitly drops the const. So I'm wondering if it wouldn't be better to
> either create a function specifically for const pointers or to just
> open-code it in the instance above.
> 
> I guess we could also convert this to a macro. Then at least there
> wouldn't be an explicit and potentially misleading const-conversion
> indicated in the function signature.

This is an intermediate step as far as I know since moving container_of to
recognize const is a bit noisy right now. I guess you can find a discussion
on the topic between Greg and Sakari.

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
