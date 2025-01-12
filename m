Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7950CC02183
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Jan 2025 23:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XlRIZ9TAyn5ETIxH8FyttkT1i3xayrrthWyRKUCxysA=; b=ABAZMQTqdDShca
	mw2icAflKLIZf69bDHRafd/2NAxrWLV3TOu217c+KsLHiN+SUJJQUL7YjXxwbS3P+h1KIruT3w/rK
	Fdym4OG62a9ss//yiozdDwy2ddtFVPOGdrvhA9q8uJ6xjkyuaFFYCIFzEjuPsc9WC0GRhzOnjpV+Z
	TsVxfLXsUmV/ORhy2eHobGy11H1O74fViTXD9f+ZyJUWiEXdpwCJHF1/Gf1lABBKxT7uxCHJM0dpV
	9gKxRRXaBhvRSlYphoTxft3ak2RccvlIE719BPwPtat54tYpPkkj46ax/dJ/wzw5iFL/rdGY5Mi6R
	soPT7jKp42BKQZ51cAIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tX71m-00000003abE-12gm;
	Sun, 12 Jan 2025 23:05:54 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tX71J-00000003aWm-0j5d
	for linux-i3c@lists.infradead.org;
	Sun, 12 Jan 2025 23:05:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C20D20002;
	Sun, 12 Jan 2025 23:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736723122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dyMxsLN0chGxhzFvSBpmH2zYUSRw+LdQtJd49x8bpsA=;
	b=fNjBMi49DffcjuDcRDSql6Db7i+ZWCIPT2qfb9Ynz18iz0uhfpKyLgs0/jAx4VnVA8JMNI
	frIwjtbTKeMGJY8JFUMAqaNXAmYnvfCPkvV3XUOOYY5ONBNm4CycR4Ax4O5Jolktb+hWWs
	09z3NrL/HOWTmjxTKrQ6herx1D4Dw4bQjEZ6czDBU5ePiI5I0huq9NrCBnWFhra38JhjGu
	bXWbNtPlFO2mvCfYgVvOF20D3GBrfY84ajqGsn82EDalrMPZ3s1Cmg0hvBdFSSirmvRerw
	ap/0NEpTdzq9gU5fEcLZAZFLMSWSPvzOVOwIZXEHc58jiZeMUp5fznWt2M4qWg==
Date: Mon, 13 Jan 2025 00:05:21 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v4 0/5] i3c: introduce and use generic parity helper
Message-ID: <173672283106.1485431.11388441970924620736.b4-ty@bootlin.com>
References: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250107090204.6593-1-wsa+renesas@sang-engineering.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_150525_357333_74330DD5 
X-CRM114-Status: UNSURE (   7.08  )
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

On Tue, 07 Jan 2025 10:01:58 +0100, Wolfram Sang wrote:
> Changes since v3:
> 
> * updated commit message of patch 4 to state that a bug gets fixed.
> 
> All acks from bitmap.h and HWMON maintainers are already included.
> 
> Old coverletter follows:
> 
> [...]

Applied, thanks!

[1/5] bitops: add generic parity calculation for u8
      https://git.kernel.org/abelloni/c/c320592f3f2a
[2/5] hwmon: (spd5118) Use generic parity calculation
      https://git.kernel.org/abelloni/c/32a8d362b515
[3/5] i3c: dw: use parity8 helper instead of open coding it
      https://git.kernel.org/abelloni/c/e89cc14e96a9
[4/5] i3c: mipi-i3c-hci: use parity8 helper instead of open coding it
      https://git.kernel.org/abelloni/c/e55905a3f33c
[5/5] i3c: cdns: use parity8 helper instead of open coding it
      https://git.kernel.org/abelloni/c/5e8c732357ce

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
