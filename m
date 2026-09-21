Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31097C982DE
	for <linux-i3c@archiver.kernel.org>; Mon, 21 Sep 2026 03:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OE3/7iqDL4gerTs9WlxIC+Gw1bvpE4bmrjGj8kng3wc=; b=0lo4g8fKotSw8C
	mFC04bZKVkvnloGEl80YaFQj95nDQuEr2Pbtv6JzSZZ9kYqUSGdeeMHxfeKheMoZlS27xtUbtmSeL
	YGX1aObhFfVGSjeRG4zl80srJba5Cu9GBrFY6YiZ7fDYUlMmea02OixBs2MJLQzCL80Ld5YCy2P7W
	gXD6gZQnKgf44F2suxVSGlw4/tnC+vC6XKxVGyV3/ZETUAqqeZQE/putp13+O+0NnxrV1KYmLi+4A
	eDij2nkJtVi79uYioXM7qLVgmyzqdYEe6Sj7xcJNfa8k7qaGJp6dUBCuyu0RM3GVkWC1tWm+stXF1
	56tgt7HeCZu5Q+fOIzfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8V08-00000000mu8-3arV;
	Mon, 21 Sep 2026 03:47:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8V07-00000000mtz-1EnK
	for linux-i3c@bombadil.infradead.org;
	Mon, 21 Sep 2026 03:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=KAkKDvhFORf2LGfFzHZLo3KGCvvHSMaEiCLfrj0YM7Q=; b=HiSAMTt5foKL/rMbW5b+IfViZw
	svoHb5NGSBQV3T1xfO5MA3pXmGE+p1uEiKDXr75Ae16wyMuSHARhiTDNGbgLTayQgoDTD/AsIc3+l
	RgDjPErRJGrE37cX+U2Y+YU6Kjzb+9mrVEEBLar6ziRog96qCr5MZl53r+7BAuJRSR9xQTj0sAw1I
	VI49ed+cv8u/P5Mvsew4ayi4IrhbxxyzGIpyKqfgf3SmQQRS3BrIeOWntv5TNO5LcoVsPSBnCMw0I
	laiUOjVums4+crxqGh0MPkGUFd8bZk8vkdf8X2IbKYw2CNBi5hWrJPSvlv0tnFZHHpVDCWWvO0dfY
	76ibQxyw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Uzm-0000000Bn7t-11qp
	for linux-i3c@lists.infradead.org;
	Mon, 21 Sep 2026 03:47:22 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68L3kXoD52233309, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1789962394;
	bh=KAkKDvhFORf2LGfFzHZLo3KGCvvHSMaEiCLfrj0YM7Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=VYkMiv7WfFsI4wqT3xs3o0U0ksuLZwwJC0DCtuStaboWSg5GfFa8fy9PUr69YnGE6
	 TBbYdhYw1NUPhIuA16mYTPve7ghhcbKEypQEIb2QgV14fkQ0+u93gEcec4Z+huhD/O
	 yuJtBrIUEHjRLzK+WfbdFccEf1MhopUwQJETBCI7zL5/SAFrVEJNMwDtJ4wPw+EcWa
	 puLDSBA7+lsECcPxoi9srQrpqZwHsnXGvfJMAmt8vD1KciIbzgpVix/utN8lIIvYqn
	 AO44Rnb4016fdqw2gHTgoDEJrbuVx2kPL0mbfq6GKycrJLmX5LNd1Wq/SQSJy9BA/B
	 4BTU127Ckf2Yg==
Received: from RS-EX-MBS2.realsil.com.cn ([172.29.17.102])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68L3kXoD52233309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Sep 2026 11:46:34 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS2.realsil.com.cn (172.29.17.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 21 Sep 2026 11:46:33 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635%9]) with mapi id
 15.02.2562.049; Mon, 21 Sep 2026 11:46:33 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vikash Bansal
	<vikash.bansal@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"mfd@lists.linux.dev" <mfd@lists.linux.dev>, =?utf-8?B?546L54Kc?=
	<wei_wang@realsil.com.cn>
Subject: =?utf-8?B?5Zue5aSNOiBbUkZDIFBBVENIIDMvNF0gcmVndWxhdG9yOiBydHM0OTB4OiBBZGQgZHJpdmVyIGZvciBvbi1kaWUgcmVndWxhdG9ycw==?=
Thread-Topic: [RFC PATCH 3/4] regulator: rts490x: Add driver for on-die
 regulators
Thread-Index: AQHdSOfKLIR/IAtYvU2nf5+oMdLbTLbW6X4AgAF7WJA=
Date: Mon, 21 Sep 2026 03:46:33 +0000
Message-ID: <fe92f1275efe4451978fc473cbad39dc@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-4-zain_zhou@realsil.com.cn>
 <58c3ea87-b7df-4c68-b22b-5102c158d5f7@kernel.org>
In-Reply-To: <58c3ea87-b7df-4c68-b22b-5102c158d5f7@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
x-originating-ip: [172.29.17.210]
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_044718_972493_0A81E510 
X-CRM114-Status: UNSURE (   6.12  )
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

On Sun, Sep 20, 2026, Krzysztof Kozlowski wrote:
> You leak OF nodes.

Thanks for the review.

Both regulators and node are declared with __free(device_node), so the
references returned by of_get_available_child_by_name() should be
dropped on scope exit, including the continue and error paths.

Could you clarify which reference is leaking?

Best regards,
Zain
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
