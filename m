Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DE4606A321
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2026 00:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iOu1ck4g;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YfcHIhAF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=McvaRpybScKphpANcc4WlvA7tQOAOBfgCn0OULTSbso=; b=iOu1ck4gAQvnkUXKDojHSWSqg5
	gxgRZ30lZoUTaYo21EKQpaIN6pz6CtFkPLmvpx8owoi0oN8uMnWoeq4jCA9nl22NjeOIlCNl9BgYq
	cdpmZmgR+x5DYloEuj/KmHpmP2Rzkwd/pKP0Efb+E2y2sn3vieEcu2+FH5za7bi59OgwM5Twky9Ub
	Lpg1FFpFwYoBUGayGo+l/+bzMIlnPbFluBFWLmdCAIbikqve0/0FZm08u5RtjIiVlmBO2sJOFDMhY
	2feTeaURlatMl49yyb5FX+rcvVxm1faBwkFg8a8NTGKOBFKpG3rgZZt39ZDnFtkBoRfFSUxgaDvoa
	zyOkVGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW137-000000089lH-318z;
	Wed, 25 Nov 2026 00:39:49 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW134-000000089ke-1ciI
	for linux-i3c@lists.infradead.org;
	Wed, 25 Nov 2026 00:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1795567176;
	bh=ddifEJUsVQ/3k7zg20+LhtIcVvTSta6RtHRdIXEKLp4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YfcHIhAFS+V9xD/DxHFPBg3q52jU1s8sm/dpBo0DUGAPk4KTeRkfl7VSW6NDS+9CV
	 qidG+M1pcl4ZZnnBgyAORSPE9nxYz2MYuiuj3G+mp4OJptuxgh3TeYr2u+mOFdrGxs
	 jO2OMhbqeTlwAmcJJQIndHGFbthNc6kro/G3pJ/IZkzZFQ5UMsZVDvabFRvmj22tSn
	 lpdbx0p3Z5izXhz9bX+iVeGzeXsajIJHWAkDJKURSUPDUbvdhOKY8vgP39CQroV3R2
	 CEfryR7lI4y54h9XFKD+hYeGOq8kRqKbHETt2YyDpyeCS7tbYaTjWk1DMK6bYpINCV
	 PwPJVMXEYZJtQ==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D0B8B60895;
	Wed, 25 Nov 2026 08:39:35 +0800 (AWST)
Message-ID: <554f3a558a73c9984ec7d3395aa53aefc91d8a36.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 3/3] net: mctp i3c: clamp transfer lengths to the
 controller limits
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Shubham Patil <shubhamsanjay.patil@amd.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Matt Johnston <matt@codeconstruct.com.au>,
 linux-i3c@lists.infradead.org, 	netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	meaganlloyd@linux.microsoft.com, git@amd.com
Date: Wed, 25 Nov 2026 08:39:35 +0800
In-Reply-To: <20261124060651.1987454-4-shubhamsanjay.patil@amd.com>
References: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
	 <20261124060651.1987454-4-shubhamsanjay.patil@amd.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_163946_629535_A00615EC 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shubham,

> mctp_i3c_setup() takes the maximum read and write lengths straight from
> GETMRL and GETMWL. Those describe the endpoint alone, so on a controller
> with a smaller limit every read can be built too large and rejected.
> Transmit packets can similarly reach the controller even when they are
> larger than its transmit buffer. The receive path also allocates an skb
> for data the hardware can never deliver.
> 
> Use i3c_device_get_max_read_xfer_bytes() and
> i3c_device_get_max_write_xfer_bytes() instead, which return the smaller
> of the endpoint and controller limits.
> 
> Behaviour is unchanged when neither reports a limit, as the helpers
> return 0 exactly as the GETMRL and GETMWL fields do today.
> 
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>

Looks good, thanks!

For the MCTP side of things:

Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Since this depends on the new i3c helpers, which (I assume) would be
going through the i3c tree, I assume the whole series should stay
together?

Cheers,


Jeremy

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
