Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F4DC5320F
	for <linux-i3c@archiver.kernel.org>; Sat, 17 Aug 2024 10:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7fkhBm6EnM9f0XtRX1cDwbTJxg4nMi9xKI0E7DYTQA=; b=UMmpFnGaff7G9B
	ZR0G/yHmVsf4fpoisde1TbjP1CJAZlSHol2y4owkmYo7tNsAhWNij1XnjB1ues4HDumSLXka9O/IO
	8/bojiwpdA9Q3XatSdvky6qta+DDqVFPj2xWlHIXcg3mZ7aSIlH0QvSkxzys96ubQNxoXtWnUrBTa
	mSwVTb7+TIUrjHGSLcSbI5aiAL8PFS+3O+QJWQwdgljY6ugWHcn8r4e6WPnqefQPnjvNIgVrl7kQy
	WLbJ0f+ZiR9UgxXvOH4CtxLJgKXxZ6e4AGgDj5sosyFLeK4fmWazkMCRbOQquhICvjCP4iVJx2JDM
	oE4AePBmuLoKgGyecrXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfGE4-0000000F342-0LGG;
	Sat, 17 Aug 2024 10:00:00 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdTzf-00000000FbU-2xyD
	for linux-i3c@lists.infradead.org;
	Mon, 12 Aug 2024 12:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723465067; x=1755001067;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zVrE1ziOBDm89ZZUuFAl8nfIqMixay1u8ld1OLeodv0=;
  b=frmRGYe2y1Dq4Oxnf0wWwtB7CvJDd68/kMASfELikiIBUrlABQWa2qw5
   nAsFttUaPh0raAUjzlOsv4Y3Q0/x7OsBwkjthgI5G3ooQL3Bj05WJocbC
   yKH8MubVWfJy5CnNpi1C7MMdiltDDWjbqrlu61SVTw1ko3O/OauD+I+6Q
   dEMWSnPs1lDlZzQtogMaXoe1HGsStQQkJPJjGUr4X7/HAVGKTh1NyqhDb
   Zi9365+FOTbdnPdyfwHIeVqMuquYELWV394STjcDrCtueL07r9JwNRdGg
   2Mm1/TM3LRt7mJ1b6ETovn/KJu9Wnx/v+ZVyVDQIbgTVm0xX0XRgVqhIH
   w==;
X-CSE-ConnectionGUID: zNeiNcgOTemxsaDNdaRUcw==
X-CSE-MsgGUID: egQC/+BiQmqu+/PfMEXknw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21720286"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21720286"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 05:17:45 -0700
X-CSE-ConnectionGUID: 57/tv0/BTxaAFt7q5/9cNA==
X-CSE-MsgGUID: fSWgTmkJQVeSD94EkS4KXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="88898350"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 05:17:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sdTzY-0000000EKru-32P6;
	Mon, 12 Aug 2024 15:17:40 +0300
Date: Mon, 12 Aug 2024 15:17:40 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RESEND v3 1/6] i3c: mipi-i3c-hci: Add MIPI0100 ACPI ID to
 the I3C Support List
Message-ID: <Zrn9ZLEMVGm2e1Db@smile.fi.intel.com>
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-2-Shyam-sundar.S-k@amd.com>
 <e94efd42-bc3f-4003-8ad8-2da6500f0f13@linux.intel.com>
 <ZrYlNOjFQE9dHsVV@smile.fi.intel.com>
 <c6ef0253-9f32-46d6-a658-295e39c926b2@amd.com>
 <ZrY8UOIsud8-NM_F@smile.fi.intel.com>
 <20240809183940461e3838@mail.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240809183940461e3838@mail.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_051747_866160_8EC28A89 
X-CRM114-Status: GOOD (  25.91  )
X-Mailman-Approved-At: Sat, 17 Aug 2024 02:59:57 -0700
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

On Fri, Aug 09, 2024 at 08:39:40PM +0200, Alexandre Belloni wrote:
> On 09/08/2024 18:57:04+0300, Andy Shevchenko wrote:
> > > Please refer to the MIPI HCI I3C DisCo specification
> > > (https://members.mipi.org/wg/All-Members/document/previewpdf/89465)
> > > section 5.4. The ASL looks the same in case of AMD.
> > > 
> > > MSFT says that they want to use MIPI0100 as mentioned in the
> > > specification.
> > 
> > MIPI doesn't know how to assign the ACPI ID correctly. But again, what I put in
> > the above is the correct way of approaching.
> > 
> > > What would you advise?
> > 
> > Since my intuition and experience tells me that the two devices even based on
> > the same IP are not the same (see word 'quirk' or '.driver_data' or alike in
> > the kernel sources) the generic ID may not be used for the specific vendor
> > unless it's _the only_ vendor for the certain IP.
> 
> Just to be clear, the HCI defines the register interface to the IP but
> not the IP itself, this is just like the various USB and SD HCIs.

Thank you for this elaboration, it's a crucial aspect!

> So we will definitively see quirks as implementers will interpret the
> interface differently

With the above remark this makes a lot of sense.

> (and so I agree with everything that was said ;) )

> > So, please do as I suggested above. And file a error report (and correction
> > proposal) to the MIPI, so in "5.1 I3C Host Controller ACPI Hardware ID (_HID)"
> > they should use _CID instead of _HID and add some text like
> > "Each vendor should dedicate it's own _HID for the platform in question. The
> > same _HID as _CID may be used if and only if vendor guarantees that there 100%
> > compatibility with MIPI as described in this and other related documents."
> > 
> > I.o.w. do you 100% guarantee that MIPI HCI I3C DisCo covers all necessary
> > properties that you need for _your_ hardware? If not, use my approach, if yes,
> > use the same _HID *and* _CID.
> > 
> > Microsoft should know this as well and much better than MIPI.

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
