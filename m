Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB69CAC5A7
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=goQLzhnOE3l20ZJ2wpi3lazxbMnRKa12BnMoNYiP8ts=; b=h2xYTMArOZhPwa
	A6QGSso+VKcg5hKgCxG6qwpoTttJ1qTDi+RDuqCvaFnBCwrOWfbhmhA1qQpbL368uyWZeWYWP5bby
	uvI7lsK3ovtRpyUvjxJLmU3fgE8/qGaln+yotDnEKe1HyhG/EjcPbFMbZdMOYsbyHK1IULT7xHsk5
	0+2CwTM+aseqsqfXMKnpSSzoq5cc/m7kIPLsUsw879n75zs5OPzSxubHfCWzS6VmfFd6e5F+L9vAr
	kDU8MNKhwD8EyCHp9bNNTQ2/SIF9vwYx9SiZu5S2toSwm1bspZFMzRMYiedc70sbVRi8i0qrYWe8H
	PzGWe8aCdtrVA4kgT2Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lwN-00000009NXy-0Jnt;
	Thu, 25 Sep 2025 13:23:19 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lwJ-00000009NWG-433W
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 13:23:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758806596; x=1790342596;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4iWz/voiEz7siZfjIqLm43TubG/Oii1lMo/evkOfHWI=;
  b=hoAelVshcs6bND/KzxNRL0X7/iwOVtC4eE9R7rUpAzGrJ4R+CBwIG3h/
   oMBgNGrkSfFf+0TFNzoQ9hUMq/VF36shrPGXwa3GN3FVnkBWX8cgHmRC0
   30kGLc2O5AcXeLFpboP4V55ClLHZa7D50DPkp2qUTPDWKOv6V/qjb1Ka4
   8i/9NHBb7ka8r3mdI6+lml0LhVIcmaCNCROUoOVwxNKYLgYyOthzPPIL9
   vuUo/17X/2I+Je5/a42CtOekVOS82Jsyi4N4dHD6CpfMzeP5FldAbWG/Y
   ICBrPQK3DIckHD4sSgHwyWjdLWSvPAKlJxah2J3Lyn4JVVWWLXbVcjXF2
   w==;
X-CSE-ConnectionGUID: 8a1m8H4pT5mKzNbFxH/Nkg==
X-CSE-MsgGUID: iG8PYIvdQ0eDPQ6GQmQjRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="60822894"
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="60822894"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 06:23:15 -0700
X-CSE-ConnectionGUID: 61lDqMiaSL6gENqN3DozbA==
X-CSE-MsgGUID: k8SaqhLvQp6Ar1H+hx1rFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,292,1751266800"; 
   d="scan'208";a="177169144"
Received: from mylly.fi.intel.com (HELO [10.237.72.50]) ([10.237.72.50])
  by orviesa007.jf.intel.com with ESMTP; 25 Sep 2025 06:23:12 -0700
Message-ID: <9708c09f-5cd7-4197-b245-04d92f6b1400@linux.intel.com>
Date: Thu, 25 Sep 2025 16:23:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] i3c: mipi-i3c-hci: add microchip sama7d65 SoC
To: Frank Li <Frank.li@nxp.com>,
 Durai Manickam KR <durai.manickamkr@microchip.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 balamanikandan.gunasundar@microchip.com, nicolas.ferre@microchip.com
References: <20250918095429.232710-1-durai.manickamkr@microchip.com>
 <20250918095429.232710-3-durai.manickamkr@microchip.com>
 <aMwy9MQOf3pG4Fvw@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aMwy9MQOf3pG4Fvw@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_062316_073678_F7302147 
X-CRM114-Status: GOOD (  15.38  )
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

Hi

On 9/18/25 7:27 PM, Frank Li wrote:
> On Thu, Sep 18, 2025 at 03:24:27PM +0530, Durai Manickam KR wrote:
>> Add support for microchip sama7d65 SoC I3C HCI master only IP.
>> Features tested and supported :
>>             Standard CCC commands.
>>             I3C SDR mode private transfers in PIO mode.
>>             I2C transfers in PIO mode.
>>             Pure bus mode and mixed bus mode.
>>
>> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
>> ---
>>   drivers/i3c/master/mipi-i3c-hci/Makefile      |  3 +-
>>   drivers/i3c/master/mipi-i3c-hci/core.c        | 28 ++++++++++++
>>   drivers/i3c/master/mipi-i3c-hci/hci.h         | 12 ++++++
>>   .../i3c/master/mipi-i3c-hci/hci_quirks_mchp.c | 43 +++++++++++++++++++
>>   4 files changed, 85 insertions(+), 1 deletion(-)
>>   create mode 100644 drivers/i3c/master/mipi-i3c-hci/hci_quirks_mchp.c
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/Makefile b/drivers/i3c/master/mipi-i3c-hci/Makefile
>> index e3d3ef757035..f463afc4566a 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/Makefile
>> +++ b/drivers/i3c/master/mipi-i3c-hci/Makefile
>> @@ -4,5 +4,6 @@ obj-$(CONFIG_MIPI_I3C_HCI)		+= mipi-i3c-hci.o
>>   mipi-i3c-hci-y				:= core.o ext_caps.o pio.o dma.o \
>>   					   cmd_v1.o cmd_v2.o \
>>   					   dat_v1.o dct_v1.o \
>> -					   hci_quirks.o
>> +					   hci_quirks.o \
>> +					   hci_quirks_mchp.o
>>   obj-$(CONFIG_MIPI_I3C_HCI_PCI)		+= mipi-i3c-hci-pci.o
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index 60f1175f1f37..cb0673d62c03 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -8,6 +8,7 @@
>>    */
>>
>>   #include <linux/bitfield.h>
>> +#include <linux/clk.h>
>>   #include <linux/device.h>
>>   #include <linux/errno.h>
>>   #include <linux/i3c/master.h>
>> @@ -651,6 +652,9 @@ static int i3c_hci_init(struct i3c_hci *hci)
>>   	hci->DAT_regs = offset ? hci->base_regs + offset : NULL;
>>   	hci->DAT_entries = FIELD_GET(DAT_TABLE_SIZE, regval);
>>   	hci->DAT_entry_size = FIELD_GET(DAT_ENTRY_SIZE, regval) ? 0 : 8;
>> +	/* Microchip SAMA7D65 SoC doesnot support DAT entry size bits in the DAT section offset register */
>> +	if (hci->quirks & MCHP_HCI_QUIRK_SAMA7D65)
>> +		hci->DAT_entry_size = 8;
> 
> #define MCHP_HCI_QUIRK_FIX_DATA_ENTRY_SIZE_8
> 
> 	if (hci->quirks & MCHP_HCI_QUIRK_FIX_DATA_ENTRY_SIZE_8)
> 		hci->DAT_entry_size = 8;
> 	else
> 		hci->DAT_entry_size = FIELD_GET(DAT_ENTRY_SIZE, regval) ? 0 : 8;
> 
> in case other vendor have similar problem.
> 
Are DAT_entry_size and DCT_entry_size quirks even needed? Does your HW 
read nonzero values and you need the quirk?

>> +	/* Microchip SAMA7d65 SoC supports only PIO mode */
>> +	if (hci->quirks & MCHP_HCI_QUIRK_PIO_MODE)
>> +		hci->RHS_regs = NULL;
>> +

Please use existing HCI_QUIRK_PIO_MODE quirk and then you don't need 
this added code.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
