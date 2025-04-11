Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EF0C369AB
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Apr 2025 20:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkHrC/gG7eo4qfFc6rulV4Mc8h0d5isO86ZHhpRujC4=; b=d9E7EJAC/ovyf+
	ZOSfgVrVYWd3rA5DxRpG1E7NbP06DzhZFxjeDFJzoTRSALRE4NCZxzgh33kE0W6hOmgTGcwFPZxum
	4K72EKNBfLyEjEzFbVoV/NvmOikRQjcE5WekBw29pa893nBke89zIPUYUjLelDrBSp9r0cR8Qtmx0
	n7JhGT3Gj2Qcpbcf6aB9N1CR4yDVbmTHQ/5+T5CV09cy3cw8GYul5g9xY5vNUXiQnc/lyUn1nQ/dk
	pVdbPAZlixeQfAl76daw6dg20bs74Tp8fKvQmF7mv7YyoOSKQyw4xOpL85LYCE5iSf9C89t0NiX88
	gpnsjGY575Iv4lTbJYqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3L1c-0000000Eoxb-1krv;
	Fri, 11 Apr 2025 20:30:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3L1b-0000000EoxG-2lxH
	for linux-i3c@lists.infradead.org;
	Fri, 11 Apr 2025 20:30:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B7FD61137;
	Fri, 11 Apr 2025 20:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5593BC4CEE2;
	Fri, 11 Apr 2025 20:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744403454;
	bh=IgZpynRK7I4zg1Vh1VMqbr8T90CF+k7sF5KdcrTjxEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPHH7uM/Qu0KE1Ki08vAe0SQly95cP11L1X41U2O4z0rKo9qDBuZq1t1fEcwT56WS
	 +XXHKa4eFQF7zSPmePs+9eOm0wjvKz99exST793SpBJV4jYTvxUcWuMBgerq39Uw0R
	 sp5uB8Sb0QmWxWPYkuSaH8kMbZdfF30L5ExKDo45ftSOyEvduFHhqBra54sqwguyEq
	 2c5i+ynAjxai6Z+B+QQxR5a03vfjfx+10TpNaYi+l5ivxn6MMhFu2VRq9WLq134Zqk
	 4RAh7EW2X96oTj3NvM3urA8bCdDXBhZeeZjm15g4YJ6gwcL1m6diIgdHQGZFVoAsQj
	 GoWGDeU1Xc2Kw==
Date: Fri, 11 Apr 2025 15:30:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	konradybcio@kernel.org, jarkko.nikula@linux.intel.com
Subject: Re: [PATCH v4 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
Message-ID: <174440334691.3918820.6898145674623743895.robh@kernel.org>
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-2-quic_msavaliy@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411113516.87958-2-quic_msavaliy@quicinc.com>
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


On Fri, 11 Apr 2025 17:05:14 +0530, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm I3C controller. This includes
> the necessary documentation and properties required to describe the
> hardware in the device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
