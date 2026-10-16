Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CB7CCA464
	for <linux-i3c@archiver.kernel.org>; Fri, 16 Oct 2026 12:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qGJMOymBXuMTQgwXa2WCOrpc0ejMc9xQPcC75r2KAQk=; b=QQkcnJlpiS6XVL
	kd/avLVCOWYgADKjRCaGAYT8u+Zi3/U/Yv3Mj3hfrxdk5N7A1ASvofXLhdEXUtzOVgJ7RndGmd90c
	aRoU+eKPkh51SBaYcE+fnazU2PJP0qnbY0AUdHBsM9BR2q2483nPLsyqYeceHcclrBE0VEZKxpetY
	gfpvChijMczCcRxo4nu95igasvDRmNg8MvZ+zplww3rF6x8zk+kbew9pHniQ4znyoDu/uPrHZz0Zl
	i9zenG6WwwNzoADHrDrsFD9AaFrVnuYFx9kNWaIGA39/vtjVGGGeKlHdoqpccS0p/trWi1e1E4pTS
	/KQixjqRatbrQX9qlJBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhGy-00000002wjT-3Fa7;
	Fri, 16 Oct 2026 12:42:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHhGx-00000002wj2-1mLh
	for linux-i3c@bombadil.infradead.org;
	Fri, 16 Oct 2026 12:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dN4poJwAxvndcIKDOFh8WU9B90Vp9srEjyUPaDxtJmQ=; b=od5JlzGCq3Bv/5Gie9Fv9WRPc+
	S3Vo/ziN7UIPsdGR6Fw1f7etfSPqmp9IqeJ4vFkO9uWNJsgY8PZITLeYxyR7Vsjd+0vE7i+3mOIrm
	teQLmnO5xApUxZ1+0cEhTdirR3nXey0cA0njgRR5QC+UFZUzjW+ixCZ9XyB9+kJoe+jFN7bZY3A52
	M5rAU2OH7l4o3ZyVE57fIun0zhXNM2k+Hwn667z7uGDtiN05n4Qt2HOpT7kGHl+cJMZScVLzTf5aJ
	sBgMBE5g+mvzbTWRhauLme5xdlw2GWY5/eQrmXhvPLNq5cWvvYnJoH3yIEIW/Ns3YGljVU9g/Kaz0
	vFEqMM2A==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHhGt-00000001Ut8-0BFQ
	for linux-i3c@lists.infradead.org;
	Fri, 16 Oct 2026 12:42:53 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 69GCfcsyF3514165, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1792154498;
	bh=dN4poJwAxvndcIKDOFh8WU9B90Vp9srEjyUPaDxtJmQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=go6XMcckxmD36kMU6sNsGPKV/+CAcKUpxXY21xXr6d9uB6dpcBPZq8IZL/NvWKI6n
	 Iz6ZmcexfoW97AIfn0o6n7l64gvZ6sQNR3KL0seSRPBY2tRjNDKjcXDLm2zoI0dYBM
	 yWLwX3Bb7/DFKPlzH4c7MKvlz9tbuwXZH3+glXil4oTzXkm0A6YlX9CXugQYctDjvb
	 mVfyQkvGylvXyLV80/4mS+ZMpLqyyMBgryGmYFLTuhqSz5I9YbJx6Sp7a/V9HR7X89
	 L2wslEb9wkhzKczxghArI+9N2D7tndrEi6JYNcYIUFwNsM7dqnXQ7u1zSPlmEYbV1c
	 m1hh1peHlr6sg==
Received: from RS-EX-MBS3.realsil.com.cn ([172.29.17.103])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 69GCfcsyF3514165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Oct 2026 20:41:38 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS3.realsil.com.cn (172.29.17.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 20:41:38 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635%9]) with mapi id
 15.02.2562.049; Fri, 16 Oct 2026 20:41:38 +0800
From: =?gb2312?B?1tzS+g==?= <zain_zhou@realsil.com.cn>
To: Lee Jones <lee@kernel.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Vikash Bansal
	<vikash.bansal@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	Lakshay Piplani <lakshay.piplani@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	=?gb2312?B?zfXsvw==?= <wei_wang@realsil.com.cn>
Subject: =?utf-8?B?5Zue5aSNOiBbUkZDIFBBVENIIDIvNF0gbWZkOiBBZGQgZHJpdmVyIGZvciBSZWFsdGVrIFJUUzQ5MHggSTNDIGh1Yg==?=
Thread-Topic: [RFC PATCH 2/4] mfd: Add driver for Realtek RTS490x I3C hub
Thread-Index: AQHdSOfJqQvAuTVpV0yzClLpyE4DErb8wqSAgAN+5ZA=
Date: Fri, 16 Oct 2026 12:41:38 +0000
Message-ID: <561f9d3886c94700bfad8ca8fc66b049@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-3-zain_zhou@realsil.com.cn>
 <179198542200.839288.16069032392567490984@kernel.org>
In-Reply-To: <179198542200.839288.16069032392567490984@kernel.org>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
x-originating-ip: [172.29.17.210]
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_134251_956396_C1BAC210 
X-CRM114-Status: GOOD (  10.67  )
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

On Wed, 14 Oct 2026, Lee Jones wrote:

> > +	int ret;
> > +	int i;
>
> Please declare loop counters inside the 'for' statement.

Will do, and I'll apply the same to the rest of the series.

> > +	i3c_device_get_info(i3cdev, &info);
> > +	if (I3C_PID_MANUF_ID(info.pid) != RTS490X_MANUFACTURER_ID)
> > +		return -ENODEV;
>
> Doesn't 'rts490x_i3c_ids' already match on 'I3C_MATCH_MANUF' with
> 'RTS490X_MANUFACTURER_ID'? When would this check ever trigger?

You are right, it never triggers. I'll drop it.

> > +	dev_info(dev, "%s I3C hub with %u target ports\n",
> > +		 rts490x->model, rts490x->num_target_ports);
>
> Keep the kernel log clean whenever possible please.

Will drop it. With that gone, nothing reads the model name or the part ID
any more, so in the next revision I plan to drop the part-ID table as
well and read the port count from the TARGET_PORT_COUNT field of the
capability register (REG#10), as defined by the I3C Hub Common
Architecture Specification.

> > +MODULE_DESCRIPTION("Realtek RTS490x I3C hub MFD driver");
>
> Please drop "MFD" from the description.

Will change it to "Realtek RTS490x I3C hub core driver".

Best regards,
Zain
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
