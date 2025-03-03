Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3CAC282C5
	for <linux-i3c@archiver.kernel.org>; Mon,  3 Mar 2025 08:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r+SLkGCIYMWnUED4gxNLu7gN1efUsAt4mhpXRAgck60=; b=HsXKMsFlsotZsk
	8akuoIB1D/G4XNCqCjWHC0IQ0Sb9/7vjDeUj6hzlBF0i3cClXDSJXrH+9clMHAFSwFVitWEp+x7P3
	5PFV/Y9paOEDW+Fx0ANr4RL5gK8MSPfuZj1AuGdkOmVtYTBGNqfwSKMuoSMnTFX/nRnkRcovfzeBG
	qavwHl3PwvqdjHiLt7LptwPHNGL2CmD30ccDhev5t+c86N2wtZjh5SbAN3aWZV3eTy39siaAAwsZ5
	4C+NhUywQzMoLfi48JNaJ/vwWSrWtxoTi8+7dDVsEDwNk8nmCF26noQnbosYTUIkjzXZQowuiSCOd
	5kGddqXOxmw+S5mCb1EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0sM-0000000HU6D-0XQC;
	Mon, 03 Mar 2025 08:10:10 +0000
Received: from mgamail.intel.com ([198.175.65.18])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp0sJ-0000000HU5l-2cwd
	for linux-i3c@lists.infradead.org;
	Mon, 03 Mar 2025 08:10:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740989408; x=1772525408;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3LnH1pPh8Q17zpQAGvxaiRevE7+MzO/QtA9jIuvEqBg=;
  b=M4OP6CpC6dL5IiDi7MazAm5CZusx9FPerb7W41nJnpU5PEHgw5DLR32L
   9jpNrj+2dOu6XqDL+Xf+NlDuQX6/JqGmMRjYYX2aa/NIrKQuwqCKQeEnE
   cg9I8oJk4ZpDXp8JQxjk3u4gHD9k+OC1n4LydX9MfvemXonPXEfklIaWk
   36UCYPjSMzoNQKjstohxC5G0AZW4SEDxT0Gfbq1Fydv7IpQsUSGa2GQBr
   qnnULE2fRMCjJaBNAxFuz1ZuUqUF+I3hNIeXKLVfHSUlBdi8EjI0rAt7Q
   MvXdSd6j5TcurYtUW55QaNFsnSVBzOorAvpA6UZnnuSI+cQHP9t05NWbB
   w==;
X-CSE-ConnectionGUID: DIbFyjPMSGWHf4FWKqANOg==
X-CSE-MsgGUID: 0G6MAkhiSOaDo31P6QgmbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="42043313"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="42043313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 00:10:01 -0800
X-CSE-ConnectionGUID: ecw96f7kRy+dBADwuZOdVA==
X-CSE-MsgGUID: xOelKWqSRXeglFGv7ili/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="118118051"
Received: from mylly.fi.intel.com (HELO [10.237.72.59]) ([10.237.72.59])
  by fmviesa008.fm.intel.com with ESMTP; 03 Mar 2025 00:09:59 -0800
Message-ID: <0efe8cc1-dd25-4052-a930-73e76c181307@linux.intel.com>
Date: Mon, 3 Mar 2025 10:09:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] i3c: mipi-i3c-hci: Fix handling status of
 i3c_hci_irq_handler()
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250228141802.1344453-1-jarkko.nikula@linux.intel.com>
 <20250228141802.1344453-2-jarkko.nikula@linux.intel.com>
 <Z8Hg+o/oOPUd3oL7@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Z8Hg+o/oOPUd3oL7@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_001007_749418_246A28B8 
X-CRM114-Status: GOOD (  18.02  )
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

On 2/28/25 6:14 PM, Frank Li wrote:
> On Fri, Feb 28, 2025 at 04:18:00PM +0200, Jarkko Nikula wrote:
>> Return IRQ_HANDLED from the i3c_hci_irq_handler() only if some
>> INTR_STATUS bit was set or if DMA/PIO handler handled it.
>>
>> Currently it returns IRQ_HANDLED in case INTR_STATUS is zero and IO
>> handler returns false. Which could be the case if interrupt comes from
>> other device or is spurious.
>>
>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>> ---
>>   drivers/i3c/master/mipi-i3c-hci/core.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
>> index e139d7e4d252..e5593b6e897e 100644
>> --- a/drivers/i3c/master/mipi-i3c-hci/core.c
>> +++ b/drivers/i3c/master/mipi-i3c-hci/core.c
>> @@ -594,6 +594,7 @@ static irqreturn_t i3c_hci_irq_handler(int irq, void *dev_id)
>>
>>   	if (val) {
>>   		reg_write(INTR_STATUS, val);
>> +		result = IRQ_HANDLED;
> 
> Not related this patch.
> reg_write(INTR_STATUS, val); should be unconditional since INTR_STATUS is
> w1c.
> 
> I am strange why need return IRQ_NONE case. I suppose it should always
> return IRQ_HANDLED.
> 
This makes driver more ready for shared interrupts and let kernel 
interrupt code be able to disable bad behaving interrupt (misrouted, 
wrong polarity, etc) by returning IRQ_NONE when we know interrupt wasn't 
generated by this device.

Currently driver doesn't support shared interrupts since IRQF_SHARED 
flag is not passed to the devm_request_irq() call in i3c_hci_probe(). I 
didn't change that since I don't have a setup to test.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
