Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BABC52D6D
	for <linux-i3c@archiver.kernel.org>; Tue,  6 Aug 2024 07:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SwR6UKE/jVnLezFJFvZyBAvbeUJt5rx+nAKhvOjSXnQ=; b=Yh/kw9LO82kPW4
	3YTr6ReSGolBCtTY/T6K6A/ZqFAhJQJcSm6jQXvXf659icgeMV67J7ghRtaVyuZaF59riHG9UHoxP
	sJfx9arVA87aVu+sMMHajojwNIy++A88g5n70FNDhMoeQSwV5UatSeNtUgLgtQcnJSJNaMzgJHEm7
	lEB3RnRhH16QAFSA5ahGAxc4rOqhksm7BChvXnQbxfof5hxTlaum1JYpM9qtp2ijaMkaKEtTuNmU4
	LlMDH7e620n9hfJ9GZjNjEicHP146xCdsEt7ufnvNwAr9z5ZIgeQx3T8CvoqW6lLYHqPJHqHXrx+/
	uGub1+fXERy8HYjJO09w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEK9-00000000kGD-1PGt;
	Tue, 06 Aug 2024 07:09:37 +0000
Received: from mgamail.intel.com ([192.198.163.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbEK6-00000000kFe-0ADh
	for linux-i3c@lists.infradead.org;
	Tue, 06 Aug 2024 07:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722928174; x=1754464174;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9O/PN2ByNNX2MAC0pEpxG3lhXMK3jbOV2GGEZLJYaNk=;
  b=NgoiC/ZNKqtSnT8NLUsRLhBWc+CE00FtTGGoWxZahzy0FvUyJAVYG+R4
   rtSkiungjNj1wActvCidYcqBH3z3XV7dU9sLaXbnhXACIRCxrW2tr1LoH
   XkYB6RKmgISnbZvQqwOp8nRAd9wSRn9juhERF7YiTA091Bt1ase/YTEZk
   LCpyMppKAG1ldeuG4Lc56Lyt2Ty/WtfeDoD5YCz9a1RDPf7d/LkKJJ6Hr
   dFtikUQcXifBqb6dDgWq/wEXhQ20hiK4u1K+CglnNQe4SMPpVKza70+m3
   QrkrQVg18Fx/hlLSYMYlj58JJkgFWkMlvExkKWjhY6BgShyPk4jTayxNt
   A==;
X-CSE-ConnectionGUID: ML2XQYL5Rg2bjqfgbqfUqQ==
X-CSE-MsgGUID: UPJG/19BRwGdGm/cvF/XLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="32329063"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="32329063"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 00:09:31 -0700
X-CSE-ConnectionGUID: rC06mci3SC2SGLuLnynhbg==
X-CSE-MsgGUID: 1NBSZX0HRkqVvBDPy9ZlLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800"; 
   d="scan'208";a="56300998"
Received: from unknown (HELO [10.237.72.57]) ([10.237.72.57])
  by orviesa010.jf.intel.com with ESMTP; 06 Aug 2024 00:09:30 -0700
Message-ID: <034b5511-e3c2-443d-8bac-8e5ed7095236@linux.intel.com>
Date: Tue, 6 Aug 2024 10:09:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] i3c: mipi-i3c-hci: Add a quirk to set PIO mode
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240724071245.3833404-1-Shyam-sundar.S-k@amd.com>
 <20240724071245.3833404-3-Shyam-sundar.S-k@amd.com>
 <a0f5ea6b-2be4-4fac-8c22-34fc21df84b2@linux.intel.com>
 <8ec23c64-0b55-4a71-8199-14cb6061ad45@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <8ec23c64-0b55-4a71-8199-14cb6061ad45@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_000934_121945_37155769 
X-CRM114-Status: GOOD (  11.03  )
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

On 8/5/24 12:26 PM, Shyam Sundar S K wrote:
> Hi,
> 
> On 8/2/2024 19:28, Jarkko Nikula wrote:
>>
>> This is true, I see this now from pre-v1.0, v1.0. v1.1 and v1.2 specs
>> too, HC_CONTROL_PIO_MODE bit is present only after v1.0. And therefore
>> version != HCI_VERSION_V1 check is not fully correct since bit is not
>> present in pre-v1.0 HW versions either.
>>
> 
> Agreed. HC_CONTROL_PIO_MODE is only present in v1.1 and v1.2.
> 
> anything below v1.0, the version check handling is already present;
> 
>          switch (regval & ~0xf) {
>          case 0x100:     /* version 1.0 */
>          case 0x110:     /* version 1.1 */
>          case 0x200:     /* version 2.0 */
>                  break;
>          default:
>                  dev_err(&hci->master.dev, "unsupported HCI version\n");
>                  return -EPROTONOSUPPORT;
>          }
> 
> Let me know your thoughts.
> 
Yeah, true. I'd still use version > v1.0 check because that reflects the 
current situation. Mostly to avoid confusion when reading the code but 
also if someone adds support for pre-v1.0 HW (perhaps unlikely) and then 
doesn't need to change version check here.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
