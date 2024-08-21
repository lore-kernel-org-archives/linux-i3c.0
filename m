Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FD8C54734
	for <linux-i3c@archiver.kernel.org>; Sun, 25 Aug 2024 01:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AVfIsImZHlARWEmiE+ySETvRIXcv+0OTeRqNMs3CAk=; b=gQZy7KxB0EW273
	H6nHOlMpjAZ3F+FJmWLYZf42xgAH4LLgF0R6X6kTcGfBNVa4eFmUskga+RItTlDApKSOMWHQJGonX
	NSYPlWJH368cft8tzDh5KXGvN4Tx77ZSYAtb8yXvkxO1LZa4zfO6ARrkD0u6R+IrS4LUeUjGBfRBX
	vF8B8g+pLak238j7XNxQGSQ3JwH/eBf2CyVfyLZby/3ubhqbXthrHFAgBUv1NsK8YytZftiN1p9Ac
	D1FEVaIptYPYyc7Jn+AAfMKq10fiC4D9iXffSuOyt/kXDbrYPAWCFypgLgn58SD2ee2maFJ72vili
	sSXuPBEY0+BenhOIU17A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1si1tt-00000003ECI-3hFQ;
	Sun, 25 Aug 2024 01:18:37 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnUr-00000009YWg-1fk3
	for linux-i3c@lists.infradead.org;
	Wed, 21 Aug 2024 15:43:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724255021; x=1755791021;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QC2ayoHYMlUTm5CleMwtaB464LNdcjG+nZPAt67rWLY=;
  b=JcQupfGVUa1QAXoojNaLJHWpvhAnKnUmDiLB5yYtplF2K7hh4FuoTwM9
   fil+4MYhEMsQ+nfn0lKWboy7PaYICvioc+MN33qFgg2u9wIIwHFCfzCaO
   g/MCYXbvNOQY5QUKtSa9O6oKVCHiNt1wj2RyfZOBIEbvg8Qg89VDNXy6I
   hRkQ0XGb2beSFOmdRM529SLFFTclL07slEx+4XgA5X+Bcv0GBG23lSB5X
   z9UZuyCZNLDeDLOTHfudbFA6zeNct8gb5EGnDQVOcwEqRPsO+qvamSHqH
   HsLz5X4ckeUj+kfBr5jVKSZSRpp+T4aeS7kgbIaYp4bGcV1S0oDiuMIPV
   A==;
X-CSE-ConnectionGUID: kE3Ii/8gQ/6qQY2nxQjMKg==
X-CSE-MsgGUID: 3NnI2XjYTlSEsIkwwNy/9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22506035"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22506035"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 08:43:41 -0700
X-CSE-ConnectionGUID: T2g6NdRQQnKbrp0/UZHS1A==
X-CSE-MsgGUID: Td9q+1Z1RY6SrUs78a4f2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="65820145"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 08:43:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sgnUm-000000008C3-2111;
	Wed, 21 Aug 2024 18:43:36 +0300
Date: Wed, 21 Aug 2024 18:43:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the
 I3C Support List
Message-ID: <ZsYLKFCvLdMn5FM3@smile.fi.intel.com>
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
 <20240821133554.391937-2-Shyam-sundar.S-k@amd.com>
 <9584ddb0-6e39-4d04-9242-a68eb4b86eba@amd.com>
 <ZsXyHfLJ8SJOW0RF@smile.fi.intel.com>
 <236aa6d9-bb5d-4854-86e3-5473f5ea6337@amd.com>
 <ZsYKGOLN3_2VU6Ld@smile.fi.intel.com>
 <ZsYK1P5nW5e1U1mJ@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsYK1P5nW5e1U1mJ@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_084341_482040_2F70A020 
X-CRM114-Status: GOOD (  19.37  )
X-Mailman-Approved-At: Sat, 24 Aug 2024 18:18:33 -0700
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

On Wed, Aug 21, 2024 at 06:42:13PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 21, 2024 at 06:39:04PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 21, 2024 at 08:42:12PM +0530, Shyam Sundar S K wrote:
> > > On 8/21/2024 19:26, Andy Shevchenko wrote:
> > > > On Wed, Aug 21, 2024 at 07:07:45PM +0530, Shyam Sundar S K wrote:
> > > >> On 8/21/2024 19:05, Shyam Sundar S K wrote:

...

> > > >>> This update adds the AMDI5017 ACPI ID to the list of supported IDs.
> > 
> > s/This update adds/Add/
> > 
> > > > Please, provide a DSDT excerpt to show how it will look like in the ACPI
> > > > tables.
> > > 
> > >     Scope (_SB)
> > >     {
> > > 	...
> > > 
> > >         Name (HCID, "AMDI5017")
> > >         Device (I3CA)
> > >         {
> > >             Method (_HID, 0, Serialized)  // _HID: Hardware ID
> > >             {
> > >                 If ((I30M == Zero))
> > >                 {
> > >                     If (CondRefOf (HCIB))
> > >                     {
> > >                         Return (HCID) /* \_SB_.HCID */
> > >                     }
> > >                     Else
> > >                     {
> > >                         Return (I3ID) /* \_SB_.I3ID */
> > 
> > Do I understand correctly that I3ID is the old one (as per another path I have
> > seen last week or so), i.o.w. *not* a MIPI allocated one?
> > 
> > If it's the case, feel free to add
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > from ACPI ID perspective.
> 
> Regarding MIPI ID and using it as a _CID is kinda unsolved now, in any case
> _CID *requires* _HID to be present, and hence _HID has a priority in
> enumeration. It doesn't matter if it's absent now (it's even more flexible in

Just to be crystal clear

 "It doesn't matter if _CID is absent now..."

> case MIPI decides to use _another_ ID for _CID) as long as software uses
> _HID for enumeration.
> 
> > >                     }
> > >                 }
> > >                 Else
> > >                 {
> > >                     Return (I2ID) /* \_SB_.I2ID */
> > >                 }
> > >             }
> > > 	
> > > 	...
> > >     }

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
