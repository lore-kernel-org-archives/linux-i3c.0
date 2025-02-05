Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95199C02192
	for <linux-i3c@archiver.kernel.org>; Wed,  5 Feb 2025 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFKOwbxSlNh6IOnk6knGmqkL66JtmNG4E8kRWT40puE=; b=sBI/95YlDuWMbLEeGDz3WzDB0N
	OMwvmj5rAaFmYqWraGxW1aLKEw1FmHpPvzBZ2P4TtrocScU21pK7n/pctWU9Ze0UUjSYsdTB5Mx0r
	nkqHR1j2gi+7kVba3ADhfCAo1xrE1v2rAYVi3AJxJfmvGgTTzmqiCE87LrPKUEBk0hC+8sgzoZYED
	FFNOsO+IMDkx7NCQprDgZZPaV11bdv0OWpzdNZxRjmDnPI58qEZ7DusFF0ZDazZlHm3k4Tb1ZTeuV
	ZqFodGxSBZe0245zgd8WnSQ5mVWfPz1SLqo18murl7hjjeHPrvHuC9XAzw54TIxYZyKHsOSJyB/J7
	AUku6zmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdaV-000000033Rk-1UEe;
	Wed, 05 Feb 2025 11:28:59 +0000
Received: from mgamail.intel.com ([192.198.163.8])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfdaT-000000033Qr-3HAr
	for linux-i3c@lists.infradead.org;
	Wed, 05 Feb 2025 11:28:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738754938; x=1770290938;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=O1aww/25Ib/9ufqzgyjLojX6pG7aKW6Kt/44ee2Xtso=;
  b=htK65lDxBp83Nb/Tlgr1SZW+A2Ca/WyVY/t2IOcxwAMRAiXzEAYzkN2j
   EqjsqSj1hHMPT6VplbfxMiug0b9VF7ZANSyN7qd4QUNBjceMoQdtxWlty
   04K5U3roFujsxRpEC8d6mKhNZJ3GZ0Zu/sk+rT/E3a7PGqx+py/3xAQ6i
   6jv/LDnERBfJWwSD1XpFGTUnddUt4rYMfL4ftg0FsVmF6lKTO/wJG9vw0
   qqmTlXQebVt5f5WXcLiaAG3DQcewfFi4N2HGTd79aKVFk2uZhukPeo5HL
   C/ANegL4T5Mf3EGeLBpEmibGaAzciZUXs0Vq2Xfl6j+Ixzgb65BEcaF3W
   w==;
X-CSE-ConnectionGUID: HI7nKNpjQbikt+4XH21Ydw==
X-CSE-MsgGUID: a7h0u3iGTAKW9euj3Q2geQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56855172"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="56855172"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 03:28:54 -0800
X-CSE-ConnectionGUID: dOqy+XJiQj+H0ds3j5JwWw==
X-CSE-MsgGUID: X+Nxs4EHQQKdTdczHq7iiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115871049"
Received: from mylly.fi.intel.com (HELO [10.237.72.153]) ([10.237.72.153])
  by orviesa004.jf.intel.com with ESMTP; 05 Feb 2025 03:28:50 -0800
Message-ID: <fad86d8c-cbf5-47cd-a144-ad803ee67417@linux.intel.com>
Date: Wed, 5 Feb 2025 13:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] i3c: mipi-i3c-hci: Use I2C DMA-safe api
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
 Billy Tsai <billy_tsai@aspeedtech.com>, alexandre.belloni@bootlin.com,
 pgaj@cadence.com, miquel.raynal@bootlin.com, conor.culhane@silvaco.com,
 aniketmaurya@google.com, Shyam-sundar.S-k@amd.com,
 wsa+renesas@sang-engineering.com, xiaopei01@kylinos.cn,
 Guruvendra.Punugupati@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <20250204091702.4014466-2-billy_tsai@aspeedtech.com>
 <3ff01e2c-fd48-40cd-b130-a515925418fb@quicinc.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <3ff01e2c-fd48-40cd-b130-a515925418fb@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_032857_831020_F9410027 
X-CRM114-Status: UNSURE (   5.54  )
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

On 2/4/25 5:16 PM, Mukesh Kumar Savaliya wrote:
> Looks good to me !
> 
> On 2/4/2025 2:47 PM, Billy Tsai wrote:
>> Use the i2c_get/put_dma_safe_msg_buf for I2C transfers instead of using
>> the I3C-specific API.
>>
>> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Acked-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
