Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1551D49221
	for <linux-i3c@archiver.kernel.org>; Mon, 18 Nov 2024 13:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKnm7z1r2pEKVHt4HERnTisTOwKmvhsbdIVLOY+HSkc=; b=QjUmXIowtnlOr0
	qJjsvixdRNNPJA5pwCtfRvLI2cSNtpWB0bxJxQ2v4fsZOWJtyHZGXJEkYt75eLby59vsR3NDW9FNq
	O0TnwOrCkQ+qH08qq9hLurKeuvtxv4GqT3vyZKl0ttlc3VtT35Y+A3w5CT4N+0HLqJNdYoJ8W/Rjp
	HsFF5n9g6dedj2w2BKvc1mlbNRGmfyyBy7EfpMJhfqc2uJuQLNDYwpuWcHoSR4HKuvw+wKa31wXfV
	3Dd9Mim5oybYdx9eoChGJ4J1PbSSBPKjw2KcTNOoDiCJndEkVLxY7azhx0cFHQEg3PoYsMICzgyOU
	Li3T8eGbjL3s0ljD0mLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1vB-00000009bbc-1jdX;
	Mon, 18 Nov 2024 13:36:05 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tD1pZ-00000009a7G-3vCE
	for linux-i3c@lists.infradead.org;
	Mon, 18 Nov 2024 13:30:19 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D4AB0240010;
	Mon, 18 Nov 2024 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731936613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oM6AbZrWm1JjX/mbzJsrlRU8XyzkzGMpUDByIVKqMWI=;
	b=oF4Tuvl16oOFVzX4Wr6fWjXrEfoFJKqFf7uK1GnG0AMym407hDfX7TReZVldBFUSadXzVU
	2ZSot3TD1b976mCGt8SQu22SihJTvhoKKbz7WmQTILC0krViD0kEY3RGD5b2GrinENrB5W
	9d25eIq1R78Tz0uungvhiz7gxC6rbGy167p4M9lDJhMOdXkgtsa0hFEG0HflTwYB1oCP3I
	PkJuVGYKGVcd8I64yTKs6mSH5DaQX0tPZuNMLrp1PYib+nYgiuwo21jEY8LFz/9qkfNEZX
	n9ZhtoZLiD2YTLfaTKQFeqP8/WXFPpU/dFcDVnfM0dtUgk7tLPUGmSC1K5sj7w==
Date: Mon, 18 Nov 2024 14:30:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jarkko.nikula@linux.intel.com, Shyam-sundar.S-k@amd.com,
	Guruvendra.Punugupati@amd.com, krishnamoorthi.m@amd.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v1] i3c: mipi-i3c-hci: Support SETDASA CCC
Message-ID: <173193659469.36588.2524558035357805471.b4-ty@bootlin.com>
References: <20241113035826.923918-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241113035826.923918-1-billy_tsai@aspeedtech.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_053018_104631_37A0EDA1 
X-CRM114-Status: UNSURE (   9.12  )
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

On Wed, 13 Nov 2024 11:58:26 +0800, Billy Tsai wrote:
> When the I3C subsystem wants to assign a dynamic address using the SETDASA
> CCC, it needs to attach the I3C device with device info that includes only
> the static address. In the HCI, if the driver want to send this SETDASA
> CCC, a DAT entry is required to temporarily fill the device's static
> address into the dynamic address field. Afterward, the reattach API will
> be executed to update the DAT with the correct dynamic addrees value.
> 
> [...]

Applied, thanks!

[1/1] i3c: mipi-i3c-hci: Support SETDASA CCC
      https://git.kernel.org/abelloni/c/2b50719dd92f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
