Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD475C5320E
	for <linux-i3c@archiver.kernel.org>; Mon, 19 Aug 2024 11:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aUEkzo95si5ShtkQc2XfrBRNhg3+fJqpcJPpdZ7bJA=; b=UQ0HErqMd74hnl
	TaVRZWVwFqFhoOp6oMOraNtLhKj74p0lqfnM0Kjb+pBA7sOqJ4dUzg55PTDAmTJg70Z+0WCPoFFTE
	AY1ldlICJOYmtPx+x73cziybk2uAUrju8ms5NShspxID9HO2Vpb1S64abhIz4iIz5F3wHSrSpd0sa
	SMlQj9gz96Gc8D6sJRc2NJRjSJyY2EXUSVLzxN6t2OntqFZxn9EQWqyU+emNcd0QOlWUn3KshPLZ4
	eHs6xTIcPwGLhFQ1D3FdW0I2AuwIkhJHgC0RbXoy1lIvIarnSDtBIIwEQHPew+io2gpXmp1xC2OOb
	QwdWeuLTY6WaDkZTPczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0JP-00000001C1K-0xBt;
	Mon, 19 Aug 2024 11:12:35 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sg0Hr-00000001BdV-0qch
	for linux-i3c@lists.infradead.org;
	Mon, 19 Aug 2024 11:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724065859; x=1755601859;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TKh/BM6H/e0b9MGjiqzrz0dvtYVC7q2xHrq4K3gMw0w=;
  b=MAmSwuMNA1V3Ttfx5Vd4/kti+hpd2jSKy0rtZcPIBcmg0kF4IgPHNH7u
   Pt79xzu8aQnjqlrpeBz3DwS570PpjkT5MkUs1wySSSGgxd2EqiNh8LS4b
   8psDNWs7QTkweaydHr+6HFABkkF5rovsksc4yaQ+AQHkswoiB9yrDdMFg
   /R5jM7YaxlP9Oh1Mx12ItaP/GZnRSeZUbncIT3b6Tctcx78C6ksNImI5n
   Qh49zcmeDmxNE7+GkqclvB+/SOUmHpo1GydKO/YaLGubImFRKiHrKT8vG
   FbYPmLBkZA1eFT1JaXXX1IkzncXBzu46k2HWHOKZYF0z3LgSjWqBrT8Az
   A==;
X-CSE-ConnectionGUID: O2n/vIbVTH6vIZPt4EPyOQ==
X-CSE-MsgGUID: pTEIK05TSPyXnijHE4jUBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="22448277"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="22448277"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 04:10:52 -0700
X-CSE-ConnectionGUID: jb32P2gUQ4CGolkfk7ooSg==
X-CSE-MsgGUID: 48UhZ1vDSCyKyKtD9QNURA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="60490256"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by fmviesa010.fm.intel.com with ESMTP; 19 Aug 2024 04:10:51 -0700
Message-ID: <9fbbefde-443d-458b-b2a7-b8e0c90af1bd@linux.intel.com>
Date: Mon, 19 Aug 2024 14:10:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/6] i3c: mipi-i3c-hci: Add a quirk to set PIO
 mode
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240807052359.290046-1-Shyam-sundar.S-k@amd.com>
 <20240807052359.290046-4-Shyam-sundar.S-k@amd.com>
 <2a9f6c23-9c7b-496b-9998-ea0afe526b46@linux.intel.com>
 <94e789ab-2e64-4a6e-804f-b5e7b2a952cb@amd.com>
 <0ae18e57-ef79-4fd8-9e9a-4c57b480b267@linux.intel.com>
 <d0ca0a49-311e-4af3-95df-f7c6f85e184f@amd.com>
 <9b8f3c29-3404-4db4-80cf-8fd1b5d018c8@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <9b8f3c29-3404-4db4-80cf-8fd1b5d018c8@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240819_041059_350275_F10A300D 
X-CRM114-Status: GOOD (  12.91  )
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

On 8/19/24 9:41 AM, Shyam Sundar S K wrote:
>> I can add an additional check with the CPU ID and distinguish them(so
>> the quirk gets applied to the affected HW versions) and just not
>> restrict to X86_VENDOR_AMD, would that be fine with you?
>>
>> OTOH, Since these are quirks (where its a broken hardware problems)
>> and the idea you suggested is related to driver data (where driver
>> data is meant to store private information about the device)
>>
>> static const struct acpi_device_id i3c_hci_acpi_match[] = {
>>       {"AMDI1234", HCI_QUIRK_PIO_MODE | HCI_QUIRK_OD_PP_TIMING |
>> HCI_QUIRK_RESP_BUF_THLD},
>>       {}
>> };
>>
>> does that not conflict? quirk vs driver data?
>>
>> I am OK to implement it the way you prefer :-)
> 
> Jarkko, any feedback on this?
> 
Sorry, forgot to reply... What do you mean about conflict? So if driver 
data would pass quirk bits as above and set only to unique ACPI ID 
specific to that HW then there is no reason to check CPU ID later in the 
code.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
