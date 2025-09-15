Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E49ECAC58E
	for <linux-i3c@archiver.kernel.org>; Mon, 15 Sep 2025 08:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etC26OazxL6mFU99E/qvNXIb7YTZR8xse5j4Eveuo4w=; b=ECqFRnoTib8uFM
	j+/yseRbUBvynM6HkPI7F0QFwHsz4DQfcUFFPnEbIBVXbkxw9Xnab8M7Eaeynk7uLm58Hsg99etGq
	3AulTPQkpGIPzPJSIIjMJ+1r1RTSSmaagdNK7+PEdX/vo1zx2M14nTj+17nXu+5a8HyYtZapEb4jN
	UsXHCyQ39Dgfvyky7GB2VZGzNSu8KUWHvQATMQZedGoAKkiGCQ2kZSMlpPl88cK7sLfn0V90dnTSk
	u7izK57q/4zWkVGsKRrJgaEdOYgIwJTRGkBn1fp67tOvyG5xkTunU+Gg+HHcZ0JYsIO3IAdE+qmkl
	yyVap/QRaxRPVw1yuD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4QJ-00000003AtS-0eCu;
	Mon, 15 Sep 2025 08:18:55 +0000
Received: from mgamail.intel.com ([192.198.163.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4QG-00000003At2-0yov
	for linux-i3c@lists.infradead.org;
	Mon, 15 Sep 2025 08:18:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757924332; x=1789460332;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JCz/qwC+LFyTg6OKAbhE0X7lOnKrN9MaXnhfK/7HxHc=;
  b=bIiW2xkBHe9U0XSOeU0V9HHonxGfTwusn0TcBpNOYyBiH7TeYLZ75qkS
   D680BrEr/kf5sCniCKcIhb6Pv7Rq8EJ+VbQfpXQ5idptYypPEvFsjSLJx
   Eble6hvaiRKRUWoYeaPgFT6GGfcgOIInCSYryhnc5TcWL6DXjw50uj2+L
   iqic/F992goQgXmh/BIZU39ZmYYoMNsPxAY1FewBHMrbT+SuZ/MM2jgy8
   ZoIGU3bAdkMY5+gqokfh4L0XzvJDIDiNAkM/Nsr+ssEkMbXKc5dXCUxJg
   5YPVMXluJyXhLDwJnXSk/6vkHzvO8GUi/FECMwO/hjpKQNU8v41UZ9K5h
   g==;
X-CSE-ConnectionGUID: QxmeBkbDShuFJvsjTEI3Fw==
X-CSE-MsgGUID: pB419ue+RfCeXqAudjVCQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60106971"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="60106971"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 01:18:52 -0700
X-CSE-ConnectionGUID: 0FOqTqY3S7+gZbI7iKmcJw==
X-CSE-MsgGUID: uLBXLBMlSSOtBq+WfyVv7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="174486612"
Received: from mylly.fi.intel.com (HELO [10.237.72.52]) ([10.237.72.52])
  by fmviesa006.fm.intel.com with ESMTP; 15 Sep 2025 01:18:51 -0700
Message-ID: <4f34a946-b343-41ab-a77e-9912b6d3efdd@linux.intel.com>
Date: Mon, 15 Sep 2025 11:18:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] i3c: mipi-i3c-hci: Convert remaining DBG() prints to
 dev_dbg()
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Frank Li <Frank.li@nxp.com>, linux-i3c@lists.infradead.org
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
 <20250827103009.243771-6-jarkko.nikula@linux.intel.com>
 <aMQuxQ2Rk8ILUl5i@lizhi-Precision-Tower-5810>
 <b5cd2d90-9b51-4760-9b2f-3505a6b02f73@linux.intel.com>
 <20250915081455ad63f5d9@mail.local>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20250915081455ad63f5d9@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_011852_285736_9CA81C70 
X-CRM114-Status: GOOD (  11.70  )
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

On 9/15/25 11:14 AM, Alexandre Belloni wrote:
> On 15/09/2025 11:06:54+0300, Jarkko Nikula wrote:
>> On 9/12/25 5:31 PM, Frank Li wrote:
>>> On Wed, Aug 27, 2025 at 01:30:09PM +0300, Jarkko Nikula wrote:
>>>> Get rid of local DBG() macro and convert remaining debug prints to
>>>> dev_dbg() which can be controlled without code recompile when kernel is
>>>> built with dynamic debug support.
>>>>
>>>> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
>>>> ---
>>>>    drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   |  9 ++-
>>>>    drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   |  7 ++-
>>>>    drivers/i3c/master/mipi-i3c-hci/core.c     | 16 +++---
>>>>    drivers/i3c/master/mipi-i3c-hci/dma.c      | 15 +++--
>>>>    drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 11 ++--
>>>>    drivers/i3c/master/mipi-i3c-hci/hci.h      |  3 -
>>>>    drivers/i3c/master/mipi-i3c-hci/pio.c      | 66 +++++++++++++---------
>>>>    7 files changed, 72 insertions(+), 55 deletions(-)
>>> ...
>>>> -#define DBG(x, ...) pr_devel("%s: " x "\n", __func__, ##__VA_ARGS__)
>>>> -
>>>>    /* 32-bit word aware bit and mask macros */
>>>>    #define W0_MASK(h, l)  GENMASK((h) - 0,  (l) - 0)
>>>>    #define W1_MASK(h, l)  GENMASK((h) - 32, (l) - 32)
>>>> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
>>>> index cde883137bc7..01e7d2833301 100644
>>>> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
>>>> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
>>>> @@ -213,7 +213,7 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
>>>>    	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
>>>>
>>>>    	if (pio) {
>>>> -		DBG("status = %#x/%#x",
>>>> +		dev_dbg(&hci->master.dev, "status = %#x/%#x",
>>>>    		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
>>>
>>> fix pio_reg_read() align to (
>>>
>> Ah, this slipped my eyes. I can send a follow up patch giving kudos to you
>> since this patch was now applied or leave it as it.
> 
> I fixed it while applying.
> 
Thanks!

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
