Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BF7E77188
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Jan 2025 15:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BTDmv5myzBWG2/WIRix2SxfA++Cvh0q6HwDyhrJWt1Y=; b=ChzdzElcR8j0TMHwexH9yuE4To
	LguMXqOHqQSYy6u5/YF5mZEBbeWeJ9D/ZkzHMsAWkaacgkGjSN+DISSeH1AP3N1FeGBAMdtAvL/QD
	9o3ECK2XpIBZkbgTZLmptrME0/ohJqKh42wDIvzjopqPUAur9SGrhRSQJLIQa8EM4fNuh27sLzKOK
	tEhW6o8fJMvzyJQk8SOB7V37TVaU1Sszyq8wP4UR2eFikLaduKjEmt8WwRbXU6FfIvOafpojUzWwK
	v9QNSG9KwnUX/AO+Xvu7ATLoUt5hHMZM/4xSkapGCOz9FHX0PnV2E2lG6geuKFCg2FNhfBccvgpRe
	VQKo0UJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVY2m-00000008yte-3KPx;
	Wed, 08 Jan 2025 15:32:28 +0000
Received: from mgamail.intel.com ([192.198.163.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVY2i-00000008yrU-1GFU
	for linux-i3c@lists.infradead.org;
	Wed, 08 Jan 2025 15:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736350344; x=1767886344;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=Mv9/7UyhAiH/KvxM0sRy2lV0OTrW9v178DpkMXDK9rI=;
  b=oIHWm3AetFzKmAREMVIQUsEg62uIuZw+Jx12AxG0pmN1gW3vWol5HHuZ
   DwAZ9MukzSkt3hLR3u8RXg1ZP5ls/BYLa7fsVmBwkdnFGEcHRbbojg63O
   EaEl3CaAlv40d6zLUXUMPTcJQX2LA6cQNr5BgobowMiuHMrSIoHpqlFN5
   GupLZmKhefCbAt2AJ9Xvyfoq0rb4UIJznPf4MGF/rrkFGJecvGWt1yVWQ
   iiYcbz9QOkus+rIO4NBxhwRccdu4R+wuw/089BQ9K7jclfLLpglQcOwp/
   0EY8jB6OjNLcHP7jCS0vJ9Xqj3cI0KjL3J8FOmFqD4eCq22Zute3vHaEN
   Q==;
X-CSE-ConnectionGUID: ndzE2webQdiOtaPCjcETbg==
X-CSE-MsgGUID: ryJk2BrTSnWrwXct1DEp2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="40524501"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="40524501"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 07:32:23 -0800
X-CSE-ConnectionGUID: mACxqiaaToug0Q9J7RYGkA==
X-CSE-MsgGUID: bwngNOGnQvOnlUXzIkY7Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; 
   d="scan'208";a="103055332"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jan 2025 07:32:22 -0800
Message-ID: <cbd9bbf3-843f-42ea-9651-c35071089210@linux.intel.com>
Date: Wed, 8 Jan 2025 17:32:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] i3c: mipi-i3c-hci: use parity8 helper instead of
 open coding it
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
 <20250107090204.6593-5-wsa+renesas@sang-engineering.com>
 <3117d2d9-260a-4e02-8c22-4e078e01ddd5@linux.intel.com>
 <Z3515cBvz3yChGoL@ninjato>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <Z3515cBvz3yChGoL@ninjato>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_073224_384942_D9921BCF 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

On 1/8/25 2:56 PM, Wolfram Sang wrote:
> 
>> Stable rules allow also cherry picking additional patches. To me picking
>> patch 1 and 4 sounds better than an intermediate fix since bug has been here
>> from the beginning. IMHO not so urgent than a regression.
> 
> Even then, doesn't that mean that the series needs to be applied
> upstream first before it can go to stable? How to describe the
> dependency commit id otherwise? Either Alexandre adds this when
> applying, or some interested party ;) sends a backport request to
> stable. Or am I missing something?
> 
Yes, the latter case was in my mind that whoever runs this driver on 
earlier stable kernel and has enough devices on the bus where previous 
code will calculate wrong can request the backport or at least be vocal 
about it :-)

I'd say backporting back to 9ad9a52cce28 ("i3c/master: introduce the 
mipi-i3c-hci driver") is also needless because driver needs other fixes 
in order to be really usable.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
