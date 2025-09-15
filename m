Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F2BCAC58F
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Sep 2025 08:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ilam5hu38sgyiVmPagmQC+00yxvL4+1N7ghpJwXjdhM=; b=Y6B228PsMfyfEy
	BcijC3/p8deXdeOCQk7RvbTa7gzLsQMg62WzFBpFYNfjbYujFEXoxamts0nqPORQ6PnGwqp3ZuquO
	q7dg2UC1QHlcB8/D8AbrCBURAgMDw6SS7GR9L9ZpCDp0T0WaWCDKlbzpmVddLyl1rJPUBQ3FvNZve
	dNkkvXV/31zEmhJdsQIkjXcjxz31W8ljKmrHsUv21tB3XtKFP/Mo4yjxB9+/YiWaWucUV0gqiT2RY
	osJjg5mqVSK6tquE8NUb2rl8Uy12hT5XAXlLHBE2mjA6uwALbnho2MFanweToNkopH2b4xvL+Cad7
	SUWILFU9cERBD2Ip5Lmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4Ep-0000000397F-162q;
	Mon, 15 Sep 2025 08:07:03 +0000
Received: from mgamail.intel.com ([192.198.163.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4En-0000000396X-0Moj
	for linux-i3c@lists.infradead.org;
	Mon, 15 Sep 2025 08:07:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757923621; x=1789459621;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=lJms2EA7szbl31YC/shS8KLnzThwRJYvI27YSAq07AA=;
  b=AUDN/ZNhLUdUnxviaVXm/N1rDjMxdFbYI+WfW7C26l5KpygQnTtNMzGA
   w0SvT//FcYsK5MnRIC3i6PBbsbcDbg6LRi78fnwW1RhDPiv/kxmZzRGbj
   6/8lSonFaC9S6IbjwuAkX+REHphEIP+LuYPCPj9bHFot/xkfTMonTENjZ
   WiQoB3LY2Ld9Wals7BfW9s0OjB2/rbOOsTqxO9Koo3MTeCILq+EBSeTgo
   bMT0Um6FXYG9eF5WbrZqQxbcwCnMQDyVGq0ZxiJv2H0iByr28VuJ3DSH2
   yl3eHyiYRPSPr6+DNElG3VSzCbrmpMJknLhJ1rn/vVYt+/71tOdWVY8Q8
   g==;
X-CSE-ConnectionGUID: u2/ryq1rSg+h7yhEhXH4mQ==
X-CSE-MsgGUID: lumrKtvfTtWZ0LnRJ/SBdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="70852094"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="70852094"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 01:06:57 -0700
X-CSE-ConnectionGUID: t8+3FRSeQayrghy4GtVgJQ==
X-CSE-MsgGUID: C1dZhdvQRxOPTu5IEMYohQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="178869957"
Received: from mylly.fi.intel.com (HELO [10.237.72.52]) ([10.237.72.52])
  by orviesa004.jf.intel.com with ESMTP; 15 Sep 2025 01:06:55 -0700
Message-ID: <b5cd2d90-9b51-4760-9b2f-3505a6b02f73@linux.intel.com>
Date: Mon, 15 Sep 2025 11:06:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] i3c: mipi-i3c-hci: Convert remaining DBG() prints to
 dev_dbg()
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
 <20250827103009.243771-6-jarkko.nikula@linux.intel.com>
 <aMQuxQ2Rk8ILUl5i@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <aMQuxQ2Rk8ILUl5i@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_010701_137502_745D8C7F 
X-CRM114-Status: GOOD (  12.53  )
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

On 9/12/25 5:31 PM, Frank Li wrote:
> On Wed, Aug 27, 2025 at 01:30:09PM +0300, Jarkko Nikula wrote:
>> Get rid of local DBG() macro and convert remaining debug prints to
>> dev_dbg() which can be controlled without code recompile when kernel is
>> built with dynamic debug support.
>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   |  9 ++-
>>   drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   |  7 ++-
>>   drivers/i3c/master/mipi-i3c-hci/core.c     | 16 +++---
>>   drivers/i3c/master/mipi-i3c-hci/dma.c      | 15 +++--
>>   drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 11 ++--
>>   drivers/i3c/master/mipi-i3c-hci/hci.h      |  3 -
>>   drivers/i3c/master/mipi-i3c-hci/pio.c      | 66 +++++++++++++---------
>>   7 files changed, 72 insertions(+), 55 deletions(-)
> ...
>> -#define DBG(x, ...) pr_devel("%s: " x "\n", __func__, ##__VA_ARGS__)
>> -
>>   /* 32-bit word aware bit and mask macros */
>>   #define W0_MASK(h, l)  GENMASK((h) - 0,  (l) - 0)
>>   #define W1_MASK(h, l)  GENMASK((h) - 32, (l) - 32)
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
>> index cde883137bc7..01e7d2833301 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
>> @@ -213,7 +213,7 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
>>   	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
>>
>>   	if (pio) {
>> -		DBG("status = %#x/%#x",
>> +		dev_dbg(&hci->master.dev, "status = %#x/%#x",
>>   		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
> 
> fix pio_reg_read() align to (
> 
Ah, this slipped my eyes. I can send a follow up patch giving kudos to 
you since this patch was now applied or leave it as it.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
