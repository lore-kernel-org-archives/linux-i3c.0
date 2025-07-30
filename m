Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26AEC87FCB
	for <linux-i3c@archiver.kernel.org>; Wed, 30 Jul 2025 23:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q8ctbXJzXq6J+dqEwznH+LpeKz/I55CNSt188GD+6do=; b=d5z9qmYygiY2tc
	TrmtBqC5lLo3ahZD7c1hQg2PlUsgTInAKXE3BG5OGi4XIVIXspfgvqilvv61ObHNgMYHh7gibL87k
	fAMlBVzbXroyCoOo8QFLIN/mWQ5VpQX1PwsMrNapmVzx/ZviA/efecCaPgZteebUsArcKQOcFI09d
	5B1SU7lCx4kKt++TewRKFIqLTMBJz9JR9RZ0JH0Ot/M+lcUqNPCtu5j/sL2vZuQ560+jUKQyznSP/
	EejxAf69S88QQMueZXw3VmhQFsetQgVmJ9rG7Bc5iusP0dLrvDqa+bhHUdmNHskdAN/LS2/NqtiCM
	Z/CJlFrbQdp2bW3NuhTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGPj-00000002cV4-2YXk;
	Wed, 30 Jul 2025 23:40:51 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGPg-00000002cTI-0O8M
	for linux-i3c@lists.infradead.org;
	Wed, 30 Jul 2025 23:40:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8645E1F68D;
	Wed, 30 Jul 2025 23:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753918845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bR3JGxpKyku1jgrheb1S4khIcDg46stmRh2K5BKlf64=;
	b=mxbHuJwBJf35OEJAIbOS6ZMU31IlF1Ipvs1fwvwHElAXPFfEHFQUN784gGTIxTgiWjL1M1
	N2V7GVNv0J3cK9ZKjq2LKYUobssHWdw3G2bH0NuvAna61l0BtMBg9qOXDow8Lqaz67d+Aj
	NAQN+fdIZPgZZRylKyglX56srZRe80MEIB/Yfp5QDMY5VjSzQhdZ/iWAI3LUSPbevxQWGb
	X5r+dTn7PeSsWaDvdmut/AVTUT+3/v/nsVays72/a/9RKNL/8fU8t/XO2nmJMXI+w5Jmdv
	J1/4ADzgqaLzacHCKPDS7uUEgBhhEHwJGJXS21MI3o1PRSPBO2FmNTovAkQMSw==
Date: Thu, 31 Jul 2025 01:40:43 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v3] i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk
Message-ID: <175391871301.1768453.9271887329370264388.b4-ty@bootlin.com>
References: <20250730003719.1825593-1-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250730003719.1825593-1-yschu@nuvoton.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelledvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeduvgeffeemfhelvdelmeehvggskeemuddugeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeduvgeffeemfhelvdelmeehvggskeemuddugeefpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepfhhrrghnkhdrlhhisehngihprdgtohhmpdhrtghpthhtohepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehlihhnuhigqdhifegtsehlihhsthhsrdhin
 hhfrhgruggvrggurdhorhhgpdhrtghpthhtohepshhtrghnlhgvhidrtghhuhihshesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhmvghrrdhmrghimhhonhesnhhuvhhothhonhdrtghomhdprhgtphhtthhopehkfihlihhusehnuhhvohhtohhnrdgtohhmpdhrtghpthhtohephihstghhuhesnhhuvhhothhonhdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_164048_263155_B30EDF99 
X-CRM114-Status: UNSURE (   9.10  )
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

On Wed, 30 Jul 2025 08:37:19 +0800, Stanley Chu wrote:
> In a private write transfer, the driver pre-fills the FIFO to work around
> the FIFO_EMPTY quirk. However, if an IBIWON event occurs, the hardware
> emits a NACK and the driver initiates a retry. During the retry, driver
> attempts to pre-fill the FIFO again if there is remaining data, but since
> the FIFO is already full, this leads to data loss.
> 
> Check available space in FIFO to prevent overflow.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: Fix npcm845 FIFO_EMPTY quirk
      https://git.kernel.org/abelloni/c/bc4a09d8e79c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
