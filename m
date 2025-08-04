Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7841FC87FCB
	for <linux-i3c@archiver.kernel.org>; Mon,  4 Aug 2025 15:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k8sQRuyl73ZER9wTWhRXgB0JqxdaGSpU/qVzsUc3vYk=; b=BWFfJboMYMNP1L
	4Ub+Yc8O5c1uPojf4NTawtRWZDQ7HGxV8x1ZXIr1tYliwf0DiNKqUWlA2KAQ7pNCXwVYESc3xUjgw
	bJMWNkx3ErdXPwcpzJX/dw3hB5TUnMLdmOWy8oUSOQeyucCq5ZsEsK6gdEgKc3vWcbXAxNclT4bua
	Rme/0KLqiCXkc2vtAQkbC0voicYsnmN3yF8Qo1doYuAwoqhaiSep87L4e0G+pJqrGJoHG2Mlr7zT6
	zbAndTsFCqaErYvtrurJBitU+ZJHBlCPExbwglEx0s6niL4cJJmuXapvNV3KbrAtlHlG3WXGEcXon
	9//0TUf18GJTV5AEkUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uix79-0000000AnMP-0zY6;
	Mon, 04 Aug 2025 15:28:39 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiwGw-0000000AgZ1-3NXZ
	for linux-i3c@lists.infradead.org;
	Mon, 04 Aug 2025 14:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754318083; x=1785854083;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=WhsfT53tNhFXzjLR/zHc/uQUT5Lhh/LhZQfZXy7/C3Q=;
  b=OHJhsb+codA7ihtTiOJGJwFcPXNnAiKbA4Ff/EPG3Ue1lO5HoQ7kdDs8
   7Brd3fguDM7n2NPKwxtTdm6n7k+gg149A/nufiTGTIZnAzd4BsKZn3cFf
   jbmdaZkoDOICRYLVla26rdAMwhJ33L1jCKlNfeWDqU8LS0ixbI89v6WBw
   oHaln/jrIP4LqaZo+NSVbViTMAksbVBMVJrhV/OP0dXslQiW5kLw1t90+
   jofTU2mM5GQnxuDF3TrnHq/ZRg3GeYhRy7IxkvfocSdXrtQkH+it08Ubq
   K8OxcWMlsdW5uypdJhwQpqomCvRgHPk2ohqahMrIActcFFRqHIqA7a8pm
   Q==;
X-CSE-ConnectionGUID: gbVzIAijQEWnFO5Tdjgplw==
X-CSE-MsgGUID: bISU/usJRtKt9TSnlZ5gpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="56508406"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="56508406"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 07:34:42 -0700
X-CSE-ConnectionGUID: tcPGk1xcSz2cGI/1MyAtbQ==
X-CSE-MsgGUID: h2ALdHk+Q2qxTO4KIIFsjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168439244"
Received: from mylly.fi.intel.com (HELO [10.237.72.51]) ([10.237.72.51])
  by fmviesa005.fm.intel.com with ESMTP; 04 Aug 2025 07:34:40 -0700
Message-ID: <5aefebb0-f5d7-4169-be06-d334ee00913f@linux.intel.com>
Date: Mon, 4 Aug 2025 17:34:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] i3c: mipi-i3c-hci: Use physical device pointer with
 DMA API
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Prabhakaran, Krishna" <krishna.prabhakaran@intel.com>
References: <20250731141420.422525-1-jarkko.nikula@linux.intel.com>
 <20250731141420.422525-3-jarkko.nikula@linux.intel.com>
 <aIzlNOxl3R6LMczU@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aIzlNOxl3R6LMczU@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_073442_889787_CB6E411B 
X-CRM114-Status: GOOD (  16.19  )
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

On 8/1/25 7:03 PM, Frank Li wrote:
> On Thu, Jul 31, 2025 at 05:14:19PM +0300, Jarkko Nikula wrote:
>> @@ -194,11 +196,23 @@ static int hci_dma_init(struct i3c_hci *hci)
>>   {
>>   	struct hci_rings_data *rings;
>>   	struct hci_rh_data *rh;
>> +	struct device *sysdev;
>>   	u32 regval;
>>   	unsigned int i, nr_rings, xfers_sz, resps_sz;
>>   	unsigned int ibi_status_ring_sz, ibi_data_ring_sz;
>>   	int ret;
>>
>> +	/*
>> +	 * Set pointer to a physical device that does DMA and has IOMMU setup
>> +	 * done for it in case of enabled IOMMU and use it with the DMA API.
>> +	 * Here such device is either
>> +	 * "mipi-i3c-hci" platform device (OF/ACPI enumeration) parent or
>> +	 * grandparent (PCI enumeration).
>> +	 */
>> +	sysdev = hci->master.dev.parent;
>> +	if (sysdev->parent && dev_is_pci(sysdev->parent))
>> +		sysdev = sysdev->parent;
>> +
> 
> I am not clear about how i3c master controller device create in your
> platform. If use DT, i3c master controller should direct refer to a iommu
> 
> i3c-master@123456 {
> 	...
> 	iommu = <&smmu id>;
> }
> 
> Is it children device of a PCIe devices?
> 
The master.dev is a "virtual" device object created by 
i3c_master_register() and for that there is no IOMMU link obviously. 
Only this IOMMU exercise revealed we were wrongly using the master.dev 
with DMA API.

For the OF/ACPI enumeration the physical device is in pdev->dev in 
drivers/i3c/master/mipi-i3c-hci/core.c: i3c_hci_probe() and that is 
passed to the i3c_master_register() and can be references via 
hci->master.dev.parent here.

PCI code needs it's own module mipi-i3c-hci-pci.c due to each module can 
have only one module_driver(), i.e. module_platform_driver() and 
module_pci_driver() cannot reside in the same module.

mipi_i3c_hci_pci_probe() creates a "mipi-i3c-hci" platform device and 
sets physical device pointer pci->dev as its parent. So in PCI case the 
i3c_hci_probe() don't have the physical device pointer in its pdev->dev 
like OF/ACPI cases have but as a parent of it.

Not very clear but that's how drivers with multiple enumeration need to 
cope with.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
