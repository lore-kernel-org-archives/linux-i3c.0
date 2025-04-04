Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AB8C3601E
	for <linux-i3c@archiver.kernel.org>; Fri,  4 Apr 2025 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3f+wUMW5c9ih7RKXvEMRbXcC8AZTQc0EMWdyukd9wk=; b=eFqKohuGendXT2
	WY4QCEnX4Tqe/YFDbo+EyrNJBbNPh2l0Djg2myQ8XVC5s8b5gy62ZuosBwCsZN5GyEqXVhXS1sqmm
	cGMtN2lKEyZUEvotZfpTKZc/rAo5LH0zDquVtsupfZBugqK73VLtvPRQlX+o0woaLj/B8VmKqW2I7
	kuSky6Wy/1h6qzUZwbAgesFlm7ckfg3iperclTRsb7Hcy2fLclRpYfeteeRG/iNq6JxMJxKvRT+ua
	/S+MGMG4iCawRAFP/MmxTvKKB8r4zVuLFnbnmawN0cQwwBT+ZtIuNKQvkbf6LhNdD/MXeDHgdxhop
	nNDa17EngzRxdzMq6O6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0eGF-0000000BP15-0hVc;
	Fri, 04 Apr 2025 10:26:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0eGC-0000000BOze-1sUW
	for linux-i3c@lists.infradead.org;
	Fri, 04 Apr 2025 10:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D9E95C6B5B;
	Fri,  4 Apr 2025 10:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41DEBC4CEDD;
	Fri,  4 Apr 2025 10:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743762410;
	bh=iMvpEdWCXh8noS82R10F1JMjxg/DwcuVVpUxdK7Pqd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pVfTof0etD6OFGBEJ4EcVsnCNAZF80HIaW4BRIy8QdRdCFjRMnqQLPwtGAtwTG9A9
	 OhneocRni33aGBta0TsaQQASrAufBwtpImQL/tu8JqT1R09NKmdbZj5P1QTV+oCPrb
	 kJk0X1SAHgvXZZW4TnLfI71+Gbwe7O5nnEV24nATX5uSqZjnLr1yriaQWrGzfiJ1VT
	 KM6mNkzQRxIjLSiH+RIwtTOqj6JvEqyBUaxRxZhS0P+WF7gc3Zgw7hi4EHiDvFZ5Kt
	 O/p0++s9Ek3/NkLVsVLEkS8dRkBKmQ1UmCwPKkVwRV+RL6vxtp0/5ipQIEtMcbWjJY
	 jHDe97eReRXYQ==
Date: Fri, 4 Apr 2025 12:26:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, konradybcio@kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
Message-ID: <20250404-rugged-terrestrial-foxhound-fcf36b@shite>
References: <20250403134644.3935983-1-quic_msavaliy@quicinc.com>
 <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403134644.3935983-2-quic_msavaliy@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_032652_526450_ABDD7D49 
X-CRM114-Status: UNSURE (   6.24  )
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

On Thu, Apr 03, 2025 at 07:16:42PM GMT, Mukesh Kumar Savaliya wrote:
> +allOf:
> +  - $ref: i3c.yaml#
> +
> +properties:
> +  compatible:
> +    - qcom,geni-i3c
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: se

Drop, not that useful.

Best regards,
Krzysztof


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
