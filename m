Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04036D132CF
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Nov 2024 14:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ziKClMcsHEr6rThoRC3gndTON00PBCoAvCyin6XMvxI=; b=rN3g9W9hwMwkB3
	6eTNbXQI0qS0RTxUEnCvyTBuistc2W202ZLH9DsXK8afDXha8YCjeCz1d2W2z4HOzYD+qQHOwkZ1A
	7XgEkrPoWkMJswmWaHukGcjtj3LtNfXiv7g33G/dBk9ttrlCSfhQhNnytNgo1wDWnSSTCyf3pKAER
	tuVJ63NJqTihLFYbGZnmqLd3s3dzgPsabYDwkLShMRv9mcHmIbGwRjf/+o2pZzbmYCbjxkcMCqKmz
	9ZY3Zg2WpFlbmNlgBtDg2CWmazkoEtWLHq1GYXAeNMha2vN5fneV7RGSiPE6TNroAifZBzDSEGtm1
	BMkkudZ2JVDCBiR53/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xnx-0000000E09z-0T0g;
	Mon, 04 Nov 2024 14:11:41 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xHD-0000000DtjD-2CIS
	for linux-i3c@lists.infradead.org;
	Mon, 04 Nov 2024 13:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730727472; x=1762263472;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=IhAcYfdZFdlYF9jACuVXbAJ16EkEdDKfa6QrRiZ0ouo=;
  b=VP6xIzOoJz3vG8nsQM3Bz8Qju1b3Z30zwTuiWWtsOb6DJOZVK0spnopv
   wVqyUoV1mMWKVVRIlCq37lfobv6CT/EgsUcHRW0ZQGprdkY0hsHjZZlML
   2gnRQBfbzCrKsqMXyQfrkYIY6qvLnZh5A58J5p/MVI8cgftdRn+YAYEpt
   bXuyDZ96AD0Un+bVZt58rpqN2zn61Ln9HUd6W68fqrKHP0XO6ePBU9BFj
   Cq138ATlCZzvOhqQtl9vULH3vWZujSNz/5SSUqKASLZkyjtU7H9aahiTo
   s49ge1IcLvuvmr2fIaVdg0qzA+0g6lCnsMexsfj6p/Hz00hUKnCXK/DC9
   Q==;
X-CSE-ConnectionGUID: Yz7UDxHJQ6GOSD1RTjuDSA==
X-CSE-MsgGUID: 7q3fSHJwT26gcbRJBHDHXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30588260"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30588260"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 05:37:50 -0800
X-CSE-ConnectionGUID: DEQQ5RNSQJG24NzVtUnskg==
X-CSE-MsgGUID: ZRrY1X7NRkq7Mlk18YrqgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="88480485"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2024 05:37:48 -0800
Message-ID: <286e13ea-360c-4082-823a-e4442528266e@linux.intel.com>
Date: Mon, 4 Nov 2024 15:37:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] Introduce initial support for the AMD I3C
 (non-HCI) to DW driver
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Sanket.Goswami@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241023055118.1400286-1-Shyam-sundar.S-k@amd.com>
 <990cdc00-92e2-41fb-bbcb-26f413b97494@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <990cdc00-92e2-41fb-bbcb-26f413b97494@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_053751_647004_51343735 
X-CRM114-Status: GOOD (  13.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On 10/29/24 5:15 PM, Shyam Sundar S K wrote:
> Hi Jarkko,
> 
> On 10/23/2024 11:21, Shyam Sundar S K wrote:
>> The AMD EPYC platform design has DIMMs connected over the I3C bus, with
>> each DIMM containing three components: SPD, PMIC, and RCD.
>>
>> To access component-specific information within the DIMMs, such as initial
>> dynamic address, static address, and provisional ID, ACPI support is
>> necessary for the I3C core. This requires adding ACPI binding to the
>> dw-i3c-master driver and retrieving slave information from the AMD ASL.
>>
>> Currently, the code is closely tied to dt-bindings. This initial set aims
>> to decouple some of these bindings by adding the AMD-specific _HID,
>> enabling the current driver to support ACPI-enabled x86 systems.
>>
>> In this series, support for following features has been added.
>> - X86/ACPI support to i3c core
>> - Support for SETAASA CCC command
>> - Add routines to plugin a SPD device to the i3c bus
>> - Workaround for AMD hardware
>> - Add dw-i3c-master driver with ACPI bindings
>>
>>
> 
> Any feedback on this series, please?
> 
Sorry, I thought I was accidentally CC'ed to the series :-)

Since I went now reading the series I'll some comments.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
