Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBE3FD68B37
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2024 16:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGKpKFJFarQc8FJ5N04M4/Q0NEuAeSqer0sKi6AuUU4=; b=pDn4UI67KcAekztJv/qKKt/Wtq
	UnFrMOQhQvRmka9eBQto+mgPO+DV8ugg6Ysd8/rbw1y3ssS3kO/jjIb0ZyEZmX/XDjqhIlbs4ZgLk
	+vOsbK95h1b4ZmUXE7IlkVsBfSEZPT4i3TTaPGPNbvZkb7xN+d0Dgbls6j/ql2bqPS/TFB426kA2d
	rECXd7gWCmMpXwF1agp5N1WVoDjUJkZDN2UptU0WDT8DUOXa/4Qwiia1TSwdY2yFEFrz73IuZjeMQ
	quTziQqQ7U94l3YTqF16r4+zNlRzMs5/mpd6TGjPrKrW9hJG5cOrdSPThzScZRfz+6EQ6doldU0pu
	KqX8c9Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcmZ-00000000935-1kzA;
	Thu, 14 Nov 2024 16:33:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcln-000000008u0-3GWY
	for linux-i3c@bombadil.infradead.org;
	Thu, 14 Nov 2024 16:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=g0pKvqrZFofIDys+Gj5Cl5oju25ImDfQsIM1TeGcyjA=; b=bO/gyNR64vGN3wCjQNEJqesyS+
	xbPRlKI2hTmrPUqMkb03YQT86VldW/wDGSYHOctpfIGVzO8KU/vzfOWM09835JBMmKH4wS+rzcFd6
	BsBSo6+fbUe+uypT9u/vXeDg6bwLfUZc/hNh4nO4XAAVg4/AUZQxcACgJDgjwDlIT+khb4iXdrrnZ
	dzfZbuUzIGtebgNSLj1oYplzKHh8al8/vsumXNaJUuWgvMX39Km+QtVB4YSjiRu4HNOWl7HySPIJy
	PUeHZS0WXYU2I5u5kSCgTyJni1dBZP+ihsi9rY88p79teMkupZtFsUQ73XvVSIHnwBR0FlQzw78E/
	+tIKIyEw==;
Received: from [198.175.65.20] (helo=mgamail.intel.com)
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBbhM-000000004ij-3KNg
	for linux-i3c@lists.infradead.org;
	Thu, 14 Nov 2024 15:23:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731597836; x=1763133836;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=1eouGy5RKoAbzPTJ1zNM2q2ty+aHjR6VzTEMr9jWGZA=;
  b=EC2jBfvqAm8xjqy9KoVDXBDYZ7p4kb9inf6v+cfH02XXgh4ctky3z9Yl
   0OHumrEIlbm2CFcO0ttzoH3mmszjq7NpjpcQ+qhrs5rUV9p4B37HqXa+N
   7C9SrPtmqfMj9abVxFkYdgbpvgw2Ivf6N/dmKmguBbbt7EHP5CMXgoYhw
   /inC+QtGWo2QBUbOHQO2BpSszU09oHNh2Jm+Lx5AkZLzKawDJvRnLumn8
   sbdp44Gr7HKsKufBCXWSumIGURtkSM3wRL1GlATWiAqAwQD/xW66AgwCg
   QL1Fv25FgrIhM8dJzqnkK1G2OQEwmfOWuN15ptb6CQrc3/bI6CouaCtlw
   g==;
X-CSE-ConnectionGUID: 1ozxSzclQXujzmUdssxxgQ==
X-CSE-MsgGUID: TGdZfHHZTKa9GA7h6/rMKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31332868"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31332868"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 07:22:44 -0800
X-CSE-ConnectionGUID: 0MPyeRKHTWuxZ8G52Ft6jw==
X-CSE-MsgGUID: x9Zo2Z8mTJWEwNEs9ZalzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="87786355"
Received: from mylly.fi.intel.com (HELO [10.237.72.151]) ([10.237.72.151])
  by fmviesa006.fm.intel.com with ESMTP; 14 Nov 2024 07:22:41 -0800
Message-ID: <ad5375b6-5a1b-4c04-a4d9-c99fb0afaeb8@linux.intel.com>
Date: Thu, 14 Nov 2024 17:22:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] i3c: mipi-i3c-hci: Support SETDASA CCC
To: Billy Tsai <billy_tsai@aspeedtech.com>, alexandre.belloni@bootlin.com,
 Shyam-sundar.S-k@amd.com, Guruvendra.Punugupati@amd.com,
 krishnamoorthi.m@amd.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241113035826.923918-1-billy_tsai@aspeedtech.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20241113035826.923918-1-billy_tsai@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_152357_308553_0E8CD7A3 
X-CRM114-Status: GOOD (  10.39  )
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

On 11/13/24 5:58 AM, Billy Tsai wrote:
> When the I3C subsystem wants to assign a dynamic address using the SETDASA
> CCC, it needs to attach the I3C device with device info that includes only
> the static address. In the HCI, if the driver want to send this SETDASA
> CCC, a DAT entry is required to temporarily fill the device's static
> address into the dynamic address field. Afterward, the reattach API will
> be executed to update the DAT with the correct dynamic addrees value.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>   drivers/i3c/master/mipi-i3c-hci/core.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
(Minor comment to the subject. Is this rather fix than support SETDASA?)

Reviewed-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
