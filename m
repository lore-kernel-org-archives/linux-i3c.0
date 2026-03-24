Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8742FF532F5
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Mar 2026 08:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovrnJflYl4ExVjgPvsKP3kivM0nRJ/F6XzBP1nWUcnc=; b=QJP0skqEHP4n1g
	LCGb2Bo3SQ6Nr0boFo9gjPZyWAQiaB1n54+LlR+PxycMaLDFPId508Q+nA5gxGGswFyAY6rGV8XnH
	Ub9A7cvQ9cN3G64K8tX7CT6ay4c98EMquEGVKhBzVQjdXmMAf5cryEM8lDIREZCyY9KR1czXbRJxk
	smsEhCt6UNuuUNL8rMFliEzF1M9LtIGUAgM0x1A1LJaPRbmFgVa/MZ82+mvqAwXs9jcJmTdtxH3kO
	K2cmk7qB67+QJMQThByHVglIRx6SBwKbuPalbjr0mA6lAulifbRQ5XmvcXaw5LwwDfNxXyEIXZFvD
	tWTCFlTetqie8GULtcSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xMX-000000010y7-15Zz;
	Tue, 24 Mar 2026 08:43:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xMT-000000010w1-39GZ
	for linux-i3c@lists.infradead.org;
	Tue, 24 Mar 2026 08:43:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A4F7F1A2FC1;
	Tue, 24 Mar 2026 08:43:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 599636011D;
	Tue, 24 Mar 2026 08:43:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CFEA10451140;
	Tue, 24 Mar 2026 09:43:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774341813; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=a9GmSnOTg+L9j9fwcn1JleBKmOTNp8HFvZV0TGPixu4=;
	b=JsLYqNY9kShjsTuKaZPhbGfT/ICR9oWxikllMZR0RInparBYg3NQ2sboF2yhX3pe43WwOu
	dL4caO17TkYCPjOhBTTCIRO2JZUTdc6DyNyAmptComizfOv/DLOTI8U82IO0B7DxUxaa9I
	/QE/odf0Rv/mppW9R9tDfNN/LUmR8+CiVN2XTWfAA0kGTdDIDdqqHCwmWzWgu1darvYymZ
	FJFhW47MVOmDV+38vtQp8GoouEg8ozHw2onhk5vPTuhxK1yIcSZhS9R+svIVgGv+1QfCHc
	/It3k71XZMPjWZvCE1GqE5hvv+l5gLIOQsZ5GTgfbLURRMXytAgl+fvAyUJuVg==
Date: Tue, 24 Mar 2026 09:43:27 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: lkp@intel.com, Frank.Li@nxp.com, acpica-devel@lists.linux.dev,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	ebiggers@kernel.org, fredrik.markstrom@est.tech,
	jonathanh@nvidia.com, krzk@kernel.org, lenb@kernel.org,
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux@roeck-us.net,
	llvm@lists.linux.dev, miquel.raynal@bootlin.com,
	oe-kbuild-all@lists.linux.dev, p.zabel@pengutronix.de,
	rafael@kernel.org, robert.moore@intel.com, robh@kernel.org,
	smangipudi@nvidia.com, thierry.reding@kernel.org
Subject: Re: [PATCH 04/12] i3c: master: Support ACPI enumeration
Message-ID: <202603240843279c9e8b90@mail.local>
References: <202603230124.VFt6CPBe-lkp@intel.com>
 <20260323184207.68515-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260323184207.68515-1-akhilrajeev@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_014342_059609_F92631F4 
X-CRM114-Status: GOOD (  18.25  )
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

On 24/03/2026 00:12:07+0530, Akhil R wrote:
> On Mon, 23 Mar 2026 01:47:20 +0800, kernel test robot wrote:
> > kernel test robot noticed the following build errors:
> > 
> > [auto build test ERROR on next-20260320]
> > [also build test ERROR on linus/master v7.0-rc4]
> > [cannot apply to i3c/i3c/next rafael-pm/linux-next rafael-pm/bleeding-edge groeck-staging/hwmon-next v7.0-rc4 v7.0-rc3 v7.0-rc2]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Akhil-R/dt-bindings-i3c-Add-mipi-i3c-static-method-to-support-SETAASA/20260322-174037
> > base:   next-20260320
> > patch link:    https://lore.kernel.org/r/20260318172820.13771-5-akhilrajeev%40nvidia.com
> > patch subject: [PATCH 04/12] i3c: master: Support ACPI enumeration
> > config: sparc-randconfig-002-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230007.WOMwklQ6-lkp@intel.com/config)
> > compiler: sparc-linux-gcc (GCC) 15.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230007.WOMwklQ6-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202603230007.WOMwklQ6-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    drivers/i3c/master.c: In function 'i3c_master_add_i2c_boardinfo':
> >>> drivers/i3c/master.c:2449:23: error: implicit declaration of function 'acpi_dev_get_resources'; did you mean 'acpi_get_event_resources'? [-Wimplicit-function-declaration]
> >     2449 |                 ret = acpi_dev_get_resources(adev, &resources,
> >          |                       ^~~~~~~~~~~~~~~~~~~~~~
> >          |                       acpi_get_event_resources
> >>> drivers/i3c/master.c:2455:17: error: implicit declaration of function 'acpi_dev_free_resource_list' [-Wimplicit-function-declaration]
> >     2455 |                 acpi_dev_free_resource_list(&resources);
> >          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> >    drivers/i3c/master.c: In function 'i3c_master_add_acpi_dev':
> >>> drivers/i3c/master.c:2556:9: error: unknown type name 'acpi_bus_address'; did you mean 'acpi_io_address'?
> >     2556 |         acpi_bus_address adr;
> >          |         ^~~~~~~~~~~~~~~~
> >          |         acpi_io_address
> >>> drivers/i3c/master.c:2563:14: error: implicit declaration of function 'acpi_has_method'; did you mean 'acpi_has_watchdog'? [-Wimplicit-function-declaration]
> >     2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
> >          |              ^~~~~~~~~~~~~~~
> >          |              acpi_has_watchdog
> >>> drivers/i3c/master.c:2563:34: error: invalid use of undefined type 'struct acpi_device'
> >     2563 |         if (!acpi_has_method(adev->handle, "_ADR"))
> >          |                                  ^~
> >>> drivers/i3c/master.c:2566:15: error: implicit declaration of function 'acpi_device_adr'; did you mean 'acpi_device_handle'? [-Wimplicit-function-declaration]
> >     2566 |         adr = acpi_device_adr(adev);
> >          |               ^~~~~~~~~~~~~~~
> >          |               acpi_device_handle
> 
> #include <linux/acpi.h> is added in PATCH 03/12. The functions' prototypes
> are present in acpi.h. I think the bot checked this patch individually,
> or did I miss something?
> 


#include <acpi/acpi_bus.h> is behind an #ifdef in acpi.h and your code
is not.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
