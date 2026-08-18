Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73994C5DF7D
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 21:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oj9rXBwdRLnP2x1eEtjKzxq9hTgUbPdJQ2sV5sUcGpI=; b=L3ERtkUrAjGFDX
	OrhgfXGd++T5jVFdl7Zsqwkxo6/E5k2T+t0gAxd5yAd6FSzdGsvTke9DjuTYG2uyONGzvZKFGVCcp
	3txZlpQiP8LvfwRAn90RoYcgALLd4G1dVa+BOaJpAUTeg39P47jem83f4zru7g7cmYRYpYLUtVUDs
	bmvHyJzy2wHXPHS2hhmcTxL7WNDJbgJzrmkiKb+wZmYHJy1NOP6h6oMDv6YD8Ei8XBxH8MF8qUWTN
	Db2ucHRabx7DIJve4PVafWhrgMIpuxTjI7iF2pjtXxw9t8yb/kQ6Y9AxSDzITTXN29UWKDBxtLfir
	Zt9B+Ji9gVPGlBNnRz1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwREE-00000008fgj-0Hde;
	Tue, 18 Aug 2026 21:20:14 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwREB-00000008fgH-1w7G
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 21:20:12 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C92741A1703;
	Tue, 18 Aug 2026 21:20:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C0A860355;
	Tue, 18 Aug 2026 21:20:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC13611C74F96;
	Tue, 18 Aug 2026 23:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787088004; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=797+hySL1ZshzifLSOrPvRGjVCN5mC8VicLFfJ25mxc=;
	b=ne8xWWpQgFTmvK12SxIH3gVBiiFrfEh3qcWxNEOGcxMjRq4J5O0jcVo8cmmUcyf6OIK+5u
	dhsXkS+CNKzzPkFWAqnC+1dYS4sLXigQmQ+jj8Sm3EU9Tqk4JxjE8UySaFfsxjekEAe2dk
	kch9C9BrmRA4TC8Wvrx3kPyGILC8L4VBRcBFt5DcgkA4KNjrgL7iPmCjQ7BPltWj/YNlyG
	Lu6AzAciXkUxzp1I+fKIWBjn/diuu8P2ZCiNfeq/uIf6ttGuYU6neVK/FneR1822/LumcZ
	0W7NM5cw9zv+lttSGu4JtmSbYSh1t9xSuDXbl904BeV/pM9L1a2PKcr9rYldlA==
Date: Tue, 18 Aug 2026 23:20:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jian-Ming Liao <Jm_Liao@asmedia.com.tw>
Cc: Frank.Li@nxp.com, adrian.hunter@intel.com,
	jarkko.nikula@linux.intel.com, boris.brezillon@collabora.com,
	linux-i3c@lists.infradead.org, Patrick_Yen@asmedia.com.tw,
	Chloe_Chen@asmedia.com.tw, Yd_Tseng@asmedia.com.tw
Subject: Re: [PATCH v4 0/3] i3c: mipi-i3c-hci: Add support for AMD_PT and PIO
 fixes
Message-ID: <178708798918.4070618.10303297538672764036.b4-ty@b4>
References: <20260818104106.763772-1-Jm_Liao@asmedia.com.tw>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260818104106.763772-1-Jm_Liao@asmedia.com.tw>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_142011_646769_AB0DD808 
X-CRM114-Status: UNSURE (   9.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 18 Aug 2026 18:41:03 +0800, Jian-Ming Liao wrote:
> This patch series introduces support for the AMD_PT I3C controller and
> includes several improvements to the MIPI I3C HCI driver to enhance
> stability and compliance with the latest specifications.
> 
> Summary of changes:
> - Patch 1: Fix missing STAT_IBI_STATUS_THLD in PIO mode by enabling
>   IBI threshold interrupts alongside error interrupts.
> - Patch 2: Add explicit PIO queue management (enablement, starting,
>   and stop/restart logic) for compliance with HCI v1.2.
> - Patch 3: Add device ID and platform support for the AMD_PT I3C
>   controller.
> 
> [...]

Applied, thanks!

[1/3] i3c: mipi-i3c-hci: Fix missing STAT_IBI_STATUS_THLD in PIO mode
      https://git.kernel.org/i3c/c/308ecb824db3
[2/3] i3c: mipi-i3c-hci: Add PIO queue management support for HCI v1.2
      https://git.kernel.org/i3c/c/ee53e1787fb0
[3/3] i3c: mipi-i3c-hci: Add support for AMD_PT I3C controller
      https://git.kernel.org/i3c/c/455b454c87bb

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
