Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB5CCD13CF
	for <linux-i3c@archiver.kernel.org>; Mon,  2 Sep 2024 06:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pV/4eRvYMsZUXe0TdRGTN6vK2vNa86b+Sf3OKVUC1h4=; b=FuPwD+NXvUihvC
	zESkiq4weD8EBzTDR4QopZUCBQrEnXOKtXkmIlhEtKgv3Emzv1H1rXBSfjc1j0sRuCJZjDm+CzTub
	mX1A8zoBKNSqDg88O4etgl9kIZGyvJ9OinbM6nhQM27inhRmOd5aHwN9QBGguvF0gIWkjTGWKReXu
	WwYNpnnpnsoUarQbAZJ7V3p2z5VZkV23PKLQlSCCR0kKOAqEUld9iNgp9+TWaUT4TG+mGnUVFlpA3
	u5XPrEGZS+PF3RChIzYIRghDrl9wHnkEyJNC5EwyRCExJoF1CToiU6t/zOYsbIua0vqX3BEnB1p9j
	xJi7lus4vJ6WUenPVKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl0NN-0000000D7yU-42x8;
	Mon, 02 Sep 2024 06:17:21 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl0NK-0000000D7xx-2JZO
	for linux-i3c@lists.infradead.org;
	Mon, 02 Sep 2024 06:17:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725257839; x=1756793839;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=NhnQQVmqO2sXYSwuZSo9bUAfvG2luwZXQ0/0pV7TRJQ=;
  b=XAxuFiaj/Dml1Gmfb1Ye2MI2w1kf76nVZra5pNTrweeoQW1aX5PAIeTV
   h9qEJcycs8adsDpaW/JIgvefSQetT5rI6nilYZghy95qZKYGUSOQLcQoW
   wNzUKY3QiB4K3FaygqlbBKiKlHPVwLD3KZWPdlmXH+vNTPvFsGV6CAH5l
   3nXeHKfJ5O9fHaCOigwu0zodmK9xKtUuK+Iw6jPaMCK+tUEs27aTQgGxt
   ePqc1lPKS+cbakLtmPseP7xIhh9JHdSzy0UByZZzrhTPOsLodGw39vzfR
   Y5VfF1VF4nVqBC+Ed66PGhVT3DcDIdQOkqcvvY9XwLT/02o60XiMIhvta
   g==;
X-CSE-ConnectionGUID: B2VCmmh3TaaJpcZMACgQhA==
X-CSE-MsgGUID: 5fsHUt8bQryPP6gPfwpzuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="35189867"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="35189867"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 23:17:18 -0700
X-CSE-ConnectionGUID: hAHGdfuhQumbegvrmC+Bpw==
X-CSE-MsgGUID: iSDzmkMtT1qMqGCYN1bU0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64197559"
Received: from mylly.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP; 01 Sep 2024 23:17:16 -0700
Message-ID: <f7476172-32b8-4eea-b1d9-bae9de8f2ffa@linux.intel.com>
Date: Mon, 2 Sep 2024 09:17:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/6] i3c: mipi-i3c-hci: Add AMDI5017 ACPI ID to the I3C
 Support List
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Guruvendra Punugupati <Guruvendra.Punugupati@amd.com>,
 Krishnamoorthi M <krishnamoorthi.m@amd.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20240829091713.736217-1-Shyam-sundar.S-k@amd.com>
 <20240829091713.736217-2-Shyam-sundar.S-k@amd.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240829091713.736217-2-Shyam-sundar.S-k@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_231718_673799_120E4F7C 
X-CRM114-Status: UNSURE (   8.92  )
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

On 8/29/24 12:17 PM, Shyam Sundar S K wrote:
> The current driver code lacks the necessary plumbing for ACPI IDs,
> preventing the mipi-i3c-hci driver from being loaded on x86
> platforms that advertise I3C ACPI support.
> 
> Add the AMDI5017 ACPI ID to the list of supported IDs.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
