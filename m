Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A669C021A0
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Feb 2025 21:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yAExNyP2mxDittAvU6Uz2adeY5p6RdTo30RK84Zeh0=; b=orFXySTmB91zW9
	Q5GVixGP3TL9kpaWkx7N0vmdKv9i8KeBQ+9/0JHzrh1PArU0W0y0y2YtGJmmsC5vjLnRdzQt5504h
	UC88n/n9QnGl0kQ6R8ClQdBjjLqzR1kQG7e6BfyxGT7v5HYlijrd4AvPML0via0Tgtvb2xqKKDLL5
	Y2SJhzMgqVy21fZPaL283a6n/af21r587VJRHnAfg/fejNC0LBsPt/BMiV+tlaHxw9G/51QrhBVfr
	AVOUzg0VJ+LwBNAXDAOIg59s70sxbw0KYkNxBJkrJ7sVjo+yPHWjRc5u/23jVPjnaqFlCb+MzWXBS
	MbMU0C4AqoCKYOcVOJTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thy0a-00000005NSb-3ctX;
	Tue, 11 Feb 2025 21:41:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thy0Y-00000005NS9-3H56
	for linux-i3c@lists.infradead.org;
	Tue, 11 Feb 2025 21:41:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 909F55C4A09;
	Tue, 11 Feb 2025 21:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CB8BC4CEDD;
	Tue, 11 Feb 2025 21:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739310089;
	bh=hNpmTU9yt5SbnmDTLYLToBPf6tZDwvIKIuOvahPOfGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aNGjIrdYDYdkZM7pguK7sMO7gXfRjF2mqrhZ4ExycwjVhX7dsQq6TCBX89Z4MBUIp
	 ED45UhLiOfB9ppFAB9uT28dv/GKrdLWZf9fREVYNi1zF1KDYJWXfhjMa/OrbgqI1Qw
	 nDyoARyL1KFsNAkI3RjvkKw5JePaNbAz2s67xrFBvXkg1S8BA3vR9BNO8VKwWcToN4
	 616J1qqqzdG7juScjVjeA/Fwe1ThPbg8rTSKs8Wv89DeR68ws92at/x0yE/234DnF/
	 ust+u29wdmUFioRZ6VWzzFCSOf4B3Je+1x4d0Kw8An03S5tcgvQGqinKwKihTlF7SG
	 pKs7gHGuKaWLA==
Date: Tue, 11 Feb 2025 15:41:28 -0600
From: Rob Herring <robh@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, alexandre.belloni@bootlin.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] i3c: master: Add Qualcomm I3C master controller
 driver
Message-ID: <20250211214128.GB1215572-robh@kernel.org>
References: <20250205143109.2955321-1-quic_msavaliy@quicinc.com>
 <20250205143109.2955321-3-quic_msavaliy@quicinc.com>
 <fec85cd8-4c56-4b48-a15f-e7ae08352cc2@kernel.org>
 <e5cad9d0-e602-442f-b216-2f655a9526e3@quicinc.com>
 <1e3a103d-d468-40c6-b03c-723427d7bb41@kernel.org>
 <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5dcc2f0-df6d-46ed-b341-46de513c0728@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_134130_868513_8901ABA7 
X-CRM114-Status: GOOD (  13.76  )
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

On Mon, Feb 10, 2025 at 09:41:28PM +0530, Mukesh Kumar Savaliya wrote:
> Thanks Krzysztof !
> 
> On 2/9/2025 5:10 PM, Krzysztof Kozlowski wrote:
> > On 07/02/2025 13:03, Mukesh Kumar Savaliya wrote:
> > > > > +	gi3c->se.clk = devm_clk_get(&pdev->dev, "se-clk");
> > > > > +	if (IS_ERR(gi3c->se.clk)) {
> > > > > +		ret = PTR_ERR(gi3c->se.clk);
> > > > > +		dev_err(&pdev->dev, "Error getting SE Core clk %d\n", ret);
> > > > > +		return ret;
> > > > > +	}
> > > > > +
> > > > > +	ret = device_property_read_u32(&pdev->dev, "se-clock-frequency", &gi3c->clk_src_freq);
> > > > 
> > > > You never tested your DTS or this code... Drop
> > > > 
> > > I have tested on SM8550 MTP only. Below entry in my internal/local DTSI.
> > 
> > 
> > And how is it supposed to work? Are you going to send us your local
> > internal DTSI? Is it going to pass any checks?
> was saying about code was testing with MTP. DTS was tested using dt-bindings
> check.

make dtbs_check is how you test.

> I should add "se-clock-frequency" and "dfs-index"

No. We already have standard clock properties and we don't put indexes 
into DT. 

Rob

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
