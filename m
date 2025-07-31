Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AD5C87FCC
	for <linux-i3c@archiver.kernel.org>; Thu, 31 Jul 2025 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n5J/5zjiinejAZqXMSGnaoWSmNwhj1mz5eBgWFsJXqo=; b=dGv38mv6k04AO4
	QwPEw35wWQo49vKUiQyAsRGWlMgTOsNXWLwamRaulomVwRD/txzB3L7a42k5OcQpLBlhX/1mlZDYF
	1N1+5qCAKoFNzDnUO2MLqSc4evCaA2EcLPoeNWoMdosRvL5LEcNkbl7VbvFiWGBq/TalK7Y7UgDzc
	RBZVM2i/Qi0S0NyVJ6LJLmW1waJ8ES1Qijk8b+LBMQUeevc2tmRVAb0RWVzsztPaX1PBFFmFR1Qs2
	kFSy1AhHZHGWCLttRmtZ4oSh5lliTZeYJWOURH3SwdTvFfLAYiYpuvDd+DSOHly3N5cBcwYp4tLaC
	TVZUht40zKCs/eAWOPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhVty-000000043bQ-3KnX;
	Thu, 31 Jul 2025 16:13:06 +0000
Received: from mgamail.intel.com ([192.198.163.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhUBW-00000003oyy-1PM7
	for linux-i3c@lists.infradead.org;
	Thu, 31 Jul 2025 14:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753971786; x=1785507786;
  h=message-id:date:mime-version:subject:from:to:cc:
   references:in-reply-to:content-transfer-encoding;
  bh=xPxM454/hp1gfC1kUgEEN9oNQMNOVKWZ/GukStqrIgM=;
  b=YNDAsBLzqW/AuIEbRKOtdGc2Z0XY4Pnxa5EoxiccTn/ptzv4+TlWmIHt
   hkrKaiRa/rCo793wInjLZFfMC9otoo8Od1ooMgUVSbb00+ZTCC9n+uKXo
   qbQlEnLZ0lVFnzeZPBNwK4Z3wRJ2j07wjrqGIxugF19o9gi8OTSgHg1zk
   ORD6Unrg0+KNQFU3gUSopJK84YxvLg5Gqs2+9pp07wGrhS7j0Wz5QFvI5
   Dz/x1grzOnsMKNMK/Rs7VzPtgia+QyrqFAhEiHD5hCH5MWELmh+Tue+t3
   L0Z3px2oywJ+BZfwnlgeGdiWLOfkD6FZWQ76S6k+nnUBd0C2S1o5flOO0
   w==;
X-CSE-ConnectionGUID: 9+pO3soFTO6RFm4CX5gnEg==
X-CSE-MsgGUID: 8/TVuJ09SgqJQJfj0+iZCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="81749288"
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="81749288"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 07:23:06 -0700
X-CSE-ConnectionGUID: paMjqjNjTjGrC1HoGDHcNg==
X-CSE-MsgGUID: aKXq3eCsT+Wbo+kFOtVhyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,353,1747724400"; 
   d="scan'208";a="163165122"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by fmviesa006.fm.intel.com with ESMTP; 31 Jul 2025 07:23:05 -0700
Message-ID: <dead6d3b-27c0-4805-a51a-dd9747990398@linux.intel.com>
Date: Thu, 31 Jul 2025 17:23:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] i3c: mipi-i3c-hci: Make bounce buffer code generic to
 all DMA transfers
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-i3c@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250604125513.1593109-1-jarkko.nikula@linux.intel.com>
 <aEBfpZ6Fa1DoFVS3@lizhi-Precision-Tower-5810>
 <bc599310-9287-4023-a204-682771574528@linux.intel.com>
 <aEG0DitRE/49aXI5@lizhi-Precision-Tower-5810>
 <37051b2a-0969-4482-91ea-85b1a9c2fc5f@linux.intel.com>
 <aEMDCi7RYbQud7WZ@lizhi-Precision-Tower-5810>
 <367523dc-d91b-4792-ab8c-f8d7e26379cd@linux.intel.com>
 <aEb38qRGQ5AIqy7R@lizhi-Precision-Tower-5810>
 <ebc6a6f1-0c9f-4ea7-8af1-585fce6ad9c6@linux.intel.com>
 <aEhmfNObvH5Dm4+W@lizhi-Precision-Tower-5810>
 <aFGFNdM+F9SUQIgi@lizhi-Precision-Tower-5810>
 <8a3b32df-b687-47be-ae4b-99008d000542@linux.intel.com>
 <9559d18b-43d3-4f74-8b9d-a5f2c32a3f36@linux.intel.com>
Content-Language: en-US
In-Reply-To: <9559d18b-43d3-4f74-8b9d-a5f2c32a3f36@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_072306_389722_72C38E57 
X-CRM114-Status: GOOD (  15.14  )
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

Hi Frank

On 6/27/25 5:17 PM, Jarkko Nikula wrote:
> Hi Frank
> 
> On 6/19/25 4:37 PM, Jarkko Nikula wrote:
>> Hi
>>
>> On 6/17/25 6:09 PM, Frank Li wrote:
>>>> Thanks, I finially understand the problem you faced. I think other 
>>>> master
>>>> controller face similar issue if they use dma. Let me think more. If 
>>>> alloc
>>>> buffer size is not align to cache line, swtlib will bounce again.
>>>>
>>>> rough idea i3c core layer provide an i3c_(un)map_api to do that.
>>>
> Unfortunately I run out of time before vacation to have a clean and 
> tested patchset about your idea but wanted to share work in progress 
> diff below. Which is not actually a standalone but goes on top of this 
> patchset.
> 
> I have mixed feeling does this yet bring enough value to the I3C core or 
> does it make sense to wait for another I3C driver using DMA to see 
> better common needs.
> 
> But I'm open for your comments and will continue after vacation :-)
> 
I sent an update where above idea was formed as a proper patch and rest 
of the patches updated accordingly. Diff between the sets below :-)

--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1786,7 +1786,7 @@ EXPORT_SYMBOL_GPL(i3c_master_dma_map_single);
   * @dev: device object of a device doing DMA
   * @dma_xfer: DMA transfer and mapping descriptor
   *
- * Unmap buffer and cleanup DMA transfer descriptor
+ * Unmap buffer and cleanup DMA transfer descriptor.
   */
  void i3c_master_dma_unmap_single(struct device *dev, struct i3c_dma 
*dma_xfer)
  {


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
