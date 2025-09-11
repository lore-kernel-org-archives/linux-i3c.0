Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10F0CAC587
	for <linux-i3c@archiver.kernel.org>; Thu, 11 Sep 2025 07:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bdum+zO027zXTZs31BeXl3YtC7NxWQmZ6s/OMOvBuZQ=; b=DBRoB1DbXn6+ci
	4+NdMxTDCC5kcaFtXgpRBa2JB035zpCqGmmr/EyeQqN+qIdzSc3TNFVRSHjHr1AgCzZwTHp6pGeR2
	I8Y8A13PFVfrOO9Y8A09qOkP6Cn2p/WPjX87kITktlT9GXw5RpJxvbP+HNXn8eodt55Oc3Hcj3Lzb
	9Lq2SW3RfV58TzWfN+/tV7TzOludO6NRnPg7Vej+fVBEkg3o92ST4GgL7kUBMzCLIHq89hPDvZhiP
	ioP5HOUIUmuE3FZqd8GWYEi9tZHnIwPCKL8rWVpnWp7MBMq7hZLChC2c7DGeAKPSP67UeGpqpMktO
	rK9bMtaHXG/8lLLkVGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbYb-00000001RDb-28O6;
	Thu, 11 Sep 2025 07:17:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwbYZ-00000001RCg-0qYq
	for linux-i3c@lists.infradead.org;
	Thu, 11 Sep 2025 07:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 59144409E3;
	Thu, 11 Sep 2025 07:17:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0020C4CEF1;
	Thu, 11 Sep 2025 07:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757575042;
	bh=3wMR5YUirmLoPyGcn3OfRq7EbTozCuJg0PvJ2aBv9I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CnlyHtvqisURuISsrxVijo3amDU6SNauC29tvDoM5DfB2RP9YUPd7RIV6OvzUSYJU
	 h8NdDOFYfkWVxoPnC2KijSWlEBhSsrRVNcYOdSRWfWXfTfRTocu8rq6NZzPLtZ4OxS
	 wIBPZwcz5jD+wncSqii9eY+jk5QAfPB3377uPxHjpE4bKFTLHlvGIuzd1blS6J0XXb
	 clg7fTSP6fn4Xjcyms/h/IZR0fKwvxDF9LgPPxif7qfaT0n3SjIWAUxt1ncacOOEG7
	 pN7yvRZM8jxh03qk7W3fV+ulwgQE3mmZpcUFSvGqMoVwN+Pj77ILPgDmtMWIU9HfVp
	 LlREz9Hyd4Upw==
Date: Thu, 11 Sep 2025 09:17:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Cc: git@amd.com, michal.simek@amd.com, alexandre.belloni@bootlin.com, 
	Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kees@kernel.org, gustavoars@kernel.org, jarkko.nikula@linux.intel.com, 
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, radhey.shyam.pandey@amd.com, srinivas.goud@amd.com, 
	shubhrajyoti.datta@amd.com, manion05gk@gmail.com
Subject: Re: [PATCH V6 1/2] dt-bindings: i3c: Add AMD I3C master controller
 support
Message-ID: <20250911-zippy-lavender-raccoon-e5326a@kuoka>
References: <20250910112954.553353-1-manikanta.guntupalli@amd.com>
 <20250910112954.553353-2-manikanta.guntupalli@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250910112954.553353-2-manikanta.guntupalli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_001723_262424_B0CE6BBE 
X-CRM114-Status: UNSURE (   9.07  )
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

On Wed, Sep 10, 2025 at 04:59:53PM +0530, Manikanta Guntupalli wrote:
> Add device tree binding documentation for the AMD I3C master controller.

and here you reflect the resolution of Rob's comments, otherwise you
will get the same question.

> 
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
> Changes for V2:
> Updated commit subject and description.
> Moved allOf to after required.
> Removed xlnx,num-targets property.
> 
> Changes for V3:
> Updated commit description.
> Corrected the order of properties and removed resets property.
> Added compatible to required list.
> Added interrupts to example.
> 
> Changes for V4:
> Added h/w documentation details.
> 
> Changes for V5:
> Renamed the xlnx,axi-i3c.yaml file into xlnx,axi-i3c-1.0.yaml.
> 
> Changes for V6:
> Corrected the file name for $id in yaml to fix the dtschema warning.

Optionally here you put that resolution...

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
