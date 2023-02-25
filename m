Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8E1C7EE2D
	for <linux-i3c@archiver.kernel.org>; Sat, 25 Feb 2023 22:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rauNg0Aj+BArkwNfF+xKqv+pW6T/8EFd+tzBxaBs0w=; b=VNXe9JIRGKcUnz
	cnzhXivCOm2FpZSehIprtpRHTbY3PvMfNExzPnUGYsvRaLQ8sWbt1GUVP8ZqrPVHROk6CJdFZAIgl
	wFWKOPfdUHH17D9cRh8JwnDg2xRQjyBlRyRpWDbfl19i2R6UVWEBxCGrG1buGiL2+i5ouQxAUfir1
	2A1wvyAWXXHZkUI9wkd6J/6b975mAqg19/IG4tFl+CTw+otRxrkO1+fOGPsg013wqcLbeX4Hefbsq
	x7jz7bdx3nf9xBD/HmLy79fQJIQgtb9ZqMsCR8YyyNFQF0LfHxKhRol+yoRL4Ini6rWNaNDwWl735
	c4LATHaFaqbIazeXWVCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pW3Mf-006PSd-2L; Sat, 25 Feb 2023 22:50:01 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pW3Mb-006PS9-5b
	for linux-i3c@lists.infradead.org; Sat, 25 Feb 2023 22:49:59 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C2D5F240002;
	Sat, 25 Feb 2023 22:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677365388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i1eJi9aFfeHw4XIo76QiONNeIzY51ZAxdJnXby/UHkk=;
	b=gD91fOoIe8nK4JHPicx55CjgNSDd+TSJdKGUj569D08+m3RHo8wutxllglTKEUEqvKItIe
	Rbm0Jrxz0JS+3GvAbtfj/cjuyq7N10jiiLjy6l1LNN4Y2AuL3gyJm9h0x/2BxwdMRggttK
	5wOQ4dosvznpzjLEckHyreeNbSdrZG4Bmrju6dFBTJgteVQfYVW5zoOPR5kFENuPnGxR/a
	QuyYJZEpMUXBcV0GTgqu3PnLZnuV+zIcOeyBtQE4nMyQPaZFX8+rM2v/MuVMF9Q1pEg6UO
	c9EGimiGaXLcRGVOjXXwvHAyWEy2A7G/GnXEtX451FHFksa26DCtI3+5Cbbc5A==
Date: Sat, 25 Feb 2023 23:49:47 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jack Chen <zenghuchen@google.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jesus Sanchez-Palencia <jesussanp@google.com>,
	Mark Slevinsky <markslevinsky@google.com>
Subject: Re: [PATCH v3] i3c: update dw-i3c-master i3c_clk_cfg function
Message-ID: <167736537001.623134.2161286183992135167.b4-ty@bootlin.com>
References: <20230216151057.293764-1-zenghuchen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230216151057.293764-1-zenghuchen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_144957_394127_1D3ABCAC 
X-CRM114-Status: UNSURE (   8.04  )
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


On Thu, 16 Feb 2023 10:10:57 -0500, Jack Chen wrote:
> Bus-speed could be default(12.5MHz) or defined by users in dts.
> Dw-i3c-master should not hard-code the initial speed to be
> I3C_BUS_TYP_I3C_SCL_RATE (12.5MHz)
> And because of Synopsys's I3C controller limit (hcnt/lcnt register
> length) and core-clk provided, there is a limit to bus speed, too.
> For example, when core-clk is 250 MHz, the bus speed cannot be
> lowered below 1MHz.
> 
> [...]

Applied, thanks!

[1/1] i3c: update dw-i3c-master i3c_clk_cfg function
      commit: 07eac9c306a0efd73a43804b50c88c67696a3c74

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
