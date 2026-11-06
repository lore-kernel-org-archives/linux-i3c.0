Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD31A60A2619
	for <linux-i3c@archiver.kernel.org>; Fri,  6 Nov 2026 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sVp2uS13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:MIME-Version:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8kDWCgKKGlbhZ1fJjYvFVip4eU3tLA14HTK7ksLZCDo=; b=sVp2uS13zEKbYPjZQXhZca+AAi
	kELBnxzOd5IyXy2s5zhO3tm69/VMhNbVudDBIDag9WoIQ50qUWWiFOk2Bpmx6aje9PU5/4RKjHbbT
	KzpNwKeZnZuWnuK3qts4zBjEVQsZvFUaMxmMUJmrVHncoiC3lbd1a54+LWKttfkyz8PG15+vldkZr
	RRTddRooz/Fvvv3VnnnMV5krHKlYMrJj7gnPkit2UX3Gt9FV9szGr/l88w0p993czJzCn0aNye/Ji
	WDSBWLDSXhO0WUu9g0nUUS7IRLwwOub+HT9NZKNXL0+DE7nCH/dsSPCgEioBhv2Fa8NvVT5VQs6K+
	1nfeTpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIB9-0000000C9eg-1o8P;
	Fri, 06 Nov 2026 11:32:19 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPIB6-0000000C9eC-3DgM
	for linux-i3c@lists.infradead.org;
	Fri, 06 Nov 2026 11:32:18 +0000
Received: from [172.100.0.8] (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowAA3QpO2uu1qM9tsAA--.22758S2;
	Fri, 06 Nov 2026 19:32:06 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank.Li@nxp.com, alexandre.belloni@bootlin.com, arnd@arndb.de,
  bbrezillon@kernel.org, gregkh@linuxfoundation.org,
  linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Fix of_node reference leak in
 of_i3c_master_add_i2c_boardinfo()
In-Reply-To: <aqr0fHT3EcOlExAj@lizhi-Precision-Tower-5810>
References: <20260916160654.2081795-1-vulab@iscas.ac.cn>
 <aqr0fHT3EcOlExAj@lizhi-Precision-Tower-5810>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 11:32:16 -0000
Message-ID: <179396473629.2291714.9103477288277081611@iscas.ac.cn>
X-CM-TRANSID: rQCowAA3QpO2uu1qM9tsAA--.22758S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYV7k0a2IF6w4kM7kC6x804xWl1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z2
	80aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
	zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr1j6rxdMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE
	74AGY7Cv6cx26r48ZrWUJr1UMxAqzxv26xkF7I0En4kS14v26r1q6r43MxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYx
	BIdaVFxhVjvjDU0xZFpf9x07bb8nOUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRMDA2rtky+YaQAAsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_033217_192996_E5370394 
X-CRM114-Status: UNSURE (   4.78  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank,

Sorry for the delayed reply.

The original patch was based on an older kernel tree. I have now checked
current mainline and found that Akhil's earlier patch [1] already
addresses the same boardinfo reference leak in the fwnode-based code.
Please disregard my duplicate patch; I will not send a v2.

For transparency, we use static analysis tools to find candidates, then
DeepSeek and GPT-6.1 Sol to assist with auditing and preparing fixes.

Thank you for your review.

[1] https://lore.kernel.org/r/20260804101301.2975911-2-akhilrajeev@nvidia.com/

Best regards,
Wentao


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
