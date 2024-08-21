Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0954DC54733
	for <linux-i3c@archiver.kernel.org>; Sun, 25 Aug 2024 01:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eoNEPPwgE882uzC7oQ8qtNCGeD9a3870kNxKRHuAA1E=; b=d1xzC2aJjQlfsq
	/omXZq/inT4T6ltrNpVW2A0Lv3ohAqVxAA3YBylD0wnkYt4df0gPMrDCN5ejOEmeuy2VxIuJgLzjF
	uGy1c3OQWBxkoMWmntqEQWT5QQOiUjPsEq1ca2oFtl/X2oVAeRqRi+bwxEgTdK69ugjBVO14HhYSo
	6pWMIhHAz/N54wc5RlREs94RVQE4DGuMoksOrFkue2138cbO/OMMBGEutsBebaXjY1bXHmH2t7iTa
	gB9Ypt9LHTM1tWD/GbOVX3mDjfY5iPx3zBcthFG5/ipNbsvmMUr8RSY1Xst0zOcQwuh4LAB+pqJpk
	DBdFbUA05q3skFO6/bDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1si1tt-00000003EC6-2N9K;
	Sun, 25 Aug 2024 01:18:37 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgnTW-00000009Y42-0tov
	for linux-i3c@lists.infradead.org;
	Wed, 21 Aug 2024 15:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724254937; x=1755790937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5HNsShXLMkfgPjD1JIyF6BszZjPotlrn/B9b0UL22AE=;
  b=S0I0mq7VlGJD/jK7yhQxcMSJ2JKnB57ZvAPP3ZY/bFOUA2tkq3KBEBTD
   8o4HiLBPYsWNdig5LU2QdX7zjvksDRstoVSfS7JhHz262cI+KmdoI9WUL
   7IsRBquOP+YNJceqvFytWyWqMURnkNHudenecQ80zZCc34DeZjMsKmHv1
   0aCfIMy2XhZ2j/pLBZsp93BpowfXOve6nr+om1+BbDjaVjO8KK0l69cly
   jOf0ppBAjWBKRlJ2yPgqzlAyi7+A0kG6Cbr75BrIH+npAfE59mrlIMPTt
   3blWgnx0C0zOUybNut5EiUMmDr9Ulq/BdWaAL5mHSLg2LTqPja7i16vRc
   Q==;
X-CSE-ConnectionGUID: nqeBGqznRmSRHT1MhlA6nQ==
X-CSE-MsgGUID: DlTQVJD5Scefi/BpVG3EHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22429927"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="22429927"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 08:42:16 -0700
X-CSE-ConnectionGUID: Jpy8QNnmQduNWlIAy0UE+A==
X-CSE-MsgGUID: jPd31TVuStmXPhrLtOfnNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; 
   d="scan'208";a="61878949"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2024 08:42:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sgnTR-000000008AO-0I9O;
	Wed, 21 Aug 2024 18:42:13 +0300
Date: Wed, 21 Aug 2024 18:42:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
	Krishnamoorthi M <krishnamoorthi.m@amd.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/6] i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the
 I3C Support List
Message-ID: <ZsYK1P5nW5e1U1mJ@smile.fi.intel.com>
References: <20240821133554.391937-1-Shyam-sundar.S-k@amd.com>
 <20240821133554.391937-2-Shyam-sundar.S-k@amd.com>
 <9584ddb0-6e39-4d04-9242-a68eb4b86eba@amd.com>
 <ZsXyHfLJ8SJOW0RF@smile.fi.intel.com>
 <236aa6d9-bb5d-4854-86e3-5473f5ea6337@amd.com>
 <ZsYKGOLN3_2VU6Ld@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsYKGOLN3_2VU6Ld@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_084218_437983_50FBA125 
X-CRM114-Status: GOOD (  17.00  )
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

On Wed, Aug 21, 2024 at 06:39:04PM +0300, Andy Shevchenko wrote:
> On Wed, Aug 21, 2024 at 08:42:12PM +0530, Shyam Sundar S K wrote:
> > On 8/21/2024 19:26, Andy Shevchenko wrote:
> > > On Wed, Aug 21, 2024 at 07:07:45PM +0530, Shyam Sundar S K wrote:
> > >> On 8/21/2024 19:05, Shyam Sundar S K wrote:

...

> > >>> This update adds the AMDI5017 ACPI ID to the list of supported IDs.
> 
> s/This update adds/Add/
> 
> > > Please, provide a DSDT excerpt to show how it will look like in the ACPI
> > > tables.
> > 
> >     Scope (_SB)
> >     {
> > 	...
> > 
> >         Name (HCID, "AMDI5017")
> >         Device (I3CA)
> >         {
> >             Method (_HID, 0, Serialized)  // _HID: Hardware ID
> >             {
> >                 If ((I30M == Zero))
> >                 {
> >                     If (CondRefOf (HCIB))
> >                     {
> >                         Return (HCID) /* \_SB_.HCID */
> >                     }
> >                     Else
> >                     {
> >                         Return (I3ID) /* \_SB_.I3ID */
> 
> Do I understand correctly that I3ID is the old one (as per another path I have
> seen last week or so), i.o.w. *not* a MIPI allocated one?
> 
> If it's the case, feel free to add
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> from ACPI ID perspective.

Regarding MIPI ID and using it as a _CID is kinda unsolved now, in any case
_CID *requires* _HID to be present, and hence _HID has a priority in
enumeration. It doesn't matter if it's absent now (it's even more flexible in
case MIPI decides to use _another_ ID for _CID) as long as software uses
_HID for enumeration.

> >                     }
> >                 }
> >                 Else
> >                 {
> >                     Return (I2ID) /* \_SB_.I2ID */
> >                 }
> >             }
> > 	
> > 	...
> >     }

-- 
With Best Regards,
Andy Shevchenko



-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
