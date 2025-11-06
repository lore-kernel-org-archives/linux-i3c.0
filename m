Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22A36CCFA13
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Nov 2025 22:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioI7T11NViqGUABjJbIJj90On5d5E59wQ4AmiHyMfnA=; b=JWaOLBVsNFFPev
	SgQEsVote7NHXsGk1g5AeOUq8zc5V7Q7Ca8CmT4ITE+KURTkEIAuOk/sf3ruNz2HsbffyfzE0VCsi
	pEuSo5Kpia5K2KLdWWzVq4OjqkZKYEOlNBGyhhH+aYzwLKyPP7NW/zPirL4bCCW5rNPiyj2nfmQsW
	HJQHSNQSLuun/az5xkzePCKAd9QuN+HA7ynKVPpQy5G4KkvMOYgAZwcVA9HfkVRpvvB3nUvuHN3Oo
	QrofBsWXLZHHnJMR2JJ9jXsu/HaobK95M4jtbnt+joBvSEpzMUKWz9SReWgGPBr0p/8eEfkbwCxTT
	2oJ4szZKDCABFG5xp4mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8C7-0000000GIVH-3AR5;
	Thu, 06 Nov 2025 22:11:03 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8C1-0000000GIUi-1VMe
	for linux-i3c@lists.infradead.org;
	Thu, 06 Nov 2025 22:11:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0113B1A1901;
	Thu,  6 Nov 2025 22:10:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BC48D606EE;
	Thu,  6 Nov 2025 22:10:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CF70C1185174E;
	Thu,  6 Nov 2025 23:10:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762467051; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=okGwbLaxnS8zbdut10ECdw0yQyNum6PGNoZZb6TW6os=;
	b=LNWyeaodd4SCncG0c7HUkCFjEY3ShkHP92Yed/PJEFu+IMwo3GZnS4/MbLLPDRI1xRLvFH
	u6J9aZXrhU+RYmafKfh4eJpUst3lAg+2t6xEwq2qbNf7++SODCIqndlvxbwizqnY7yVXgB
	w8P8Vin1tu/Gb2war5hSPjE1N5yhyEzpK3zpHznDlX0BGLMxN4FmIYX475KgMFY4C6mhcw
	gwz86O9fM2r1c3s2b9e4HKcoiQGO7DOo07mTsFXWf461JFWtSem9IowGIVaDJgyovBfh1S
	o4mF7zd0AcTd4Wxg9kPWryNUxAotUJctduOrj/KqzdDa2UV90i0X+d8jckqJhw==
Date: Thu, 6 Nov 2025 23:10:48 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: adrianhoyin.ng@altera.com
Cc: Frank.Li@nxp.com, wsa+renesas@sang-engineering.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dinguyen@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] i3c: dw: Add support for Device NACK Retry count
Message-ID: <20251106221048367d654a@mail.local>
References: <cover.1762245890.git.adrianhoyin.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1762245890.git.adrianhoyin.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_141057_886300_6F7190C7 
X-CRM114-Status: GOOD (  18.17  )
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

On 04/11/2025 16:51:07+0800, adrianhoyin.ng@altera.com wrote:
> From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>
> 
> This series adds support for configuring the Device NACK Retry count
> in the Synopsys DesignWare I3C master controller and enables the
> corresponding property in the Altera Agilex5 device tree.
> 
> Some I3C slave devices may temporarily NACK transactions when they are
> busy or not ready to respond. To enhance bus reliability, the DesignWare
> I3C controller supports a programmable retry mechanism that automatically
> reissues NACKed transactions. This series introduces the
> snps,dev-nack-retry-cnt device tree property to configure this retry
> count. The value is written into the Device Address Table (DAT) entry for
> each I3C device, enabling fine-grained control of retry behavior.
> 

As Frank explained, this needs to be a per device sysfs file because
this is definitively policy and not HW related. This file should only be
visible when the bus supports retrying.

Don't forget to add documentation in ABI/testing/sysfs-bus-i3c

> This series also fixes an issue where existing DAT entries could be
> overwritten when the driver restores device addresses. Update
> dw_i3c_master_restore_addrs to preserve existing bits in each
> DAT entry when restoring addresses.
> 
> Adrian Ng Ho Yin (4):
>   dt-bindings: i3c: Add snps,dev-nack-retry-cnt property to Synopsys I3C
>     master
>   arm64: dts: intel: agilex5: Add snps,dev-nack-retry-cnt property for
>     I3C controllers
>   i3c: dw: Add support for Device NACK Retry count
>   i3c: dw: Preserve DAT entry bits when restoring addresses
> 
>  .../bindings/i3c/snps,dw-i3c-master.yaml      |  8 ++++
>  .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  2 +
>  drivers/i3c/master/dw-i3c-master.c            | 40 ++++++++++++++++++-
>  drivers/i3c/master/dw-i3c-master.h            |  1 +
>  4 files changed, 49 insertions(+), 2 deletions(-)
> 
> -- 
> 2.49.GIT
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
