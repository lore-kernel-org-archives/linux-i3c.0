Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C79FC982FA
	for <linux-i3c@archiver.kernel.org>; Tue, 22 Sep 2026 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMHMw245L/nvANWctrZu6deANnFNr32dfn1kdgAEc8M=; b=s5grFercEXr+8I
	mKTF3sqQ8782Sxv3/X929gl5siKPDuK9EWXsndN8pEpXUvmjchp9/ctN1QV3xTGKM4Z17ZBKIcxsd
	tqccchQtDSxe18GR7/NPVh77pDgff+mYEPdU54mJEJbejioc9xho+vRMUkHjJODTHhvTcCHSa+h5w
	hYV+5lpk+buEidTV03OCxDyinEI+zRJhfY9MsR4pMe9NAjrrLlh2TRzXauKMFy6dQ6ZbWH8J2BjKK
	sOg9WLryce9B68SWYYNtD7PtPsZmFbDk7Nqrk8AxNp1dsQVz7C1toGpg2mO/qKa/J5beC05NVkd2I
	klc0DVndtXnL19IWnC6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yW6-000000059wJ-0E9n;
	Tue, 22 Sep 2026 11:18:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yW4-000000059w8-21B2
	for linux-i3c@bombadil.infradead.org;
	Tue, 22 Sep 2026 11:18:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=vmHKNujf04ClybYydx3hcwsqBhWnQx+QdwzxdTT29X0=; b=Fe+IS1usTs8myP1uNske54+dKJ
	BlLQF5ktbsplyEaI202fSmsLOHhfhXQj+y7yI77dUCvmAsGLW2vsMdnjm/L1ExK2ajp7eimU7w+Ya
	T/wsWbqLtzBjyJwnx1O/4Eh3qxzxN9HUbOvTWzIimJpi0FeWHg8yDvJDTaRjWGed6mNNehOnvOoJb
	VNG4k5sw8iQC3HbtSqGpXUt1iloXrNhvOOXTEzZxQSgTpMLBVHtugBS4syiD/pSoAJ6DooF8GnYpt
	DVE4Fa19fE+DzvnCs4GfvwRUHeOEyDNBMcB2fgiaaltVZBUwJNtBDoli6ur8S2jrcA/zR6iVAWOz9
	w7DqJ/KQ==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8yVx-0000000DTx6-3kxk
	for linux-i3c@lists.infradead.org;
	Tue, 22 Sep 2026 11:18:25 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 68MBHTc943573188, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realsil.com.cn;
	s=dkim; t=1790075850;
	bh=vmHKNujf04ClybYydx3hcwsqBhWnQx+QdwzxdTT29X0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=gk1OjVpJ+qN21rf1ebCj8jVcix41KX4smsXom+CXRJaPmDwGWS3k6Czp4/z6bg4Iy
	 pSo7DJ+eaXCdDWusXF3b+t0LWZjy/ryMOzF/B8TM8lH7y6W3j2ZO6v0xnpNNKVGO0z
	 DRKmcfIvUMy+7dPNk2665VHuan8JdF6x/LwQWp1t+nt82XpN85C2UB1mNsgJ47iFE4
	 G46HV9JwQhFFBLZ4am2Y4MDDF5smjvSbPllECQnKsEkeE5vEPqKIhTjCjs1gXmybjw
	 46slVMOEok+EDLMInWl1XCrWD32dLY51uqpHAtY0Hyt4ZftZw5Wjpgi7HBQC9nUwDm
	 aRiCQx7AJymJQ==
Received: from RS-EX-MBS3.realsil.com.cn ([172.29.17.103])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 68MBHTc943573188
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Sep 2026 19:17:29 +0800
Received: from RS-EX-MBS2.realsil.com.cn (172.29.17.102) by
 RS-EX-MBS3.realsil.com.cn (172.29.17.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 22 Sep 2026 19:17:29 +0800
Received: from RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635]) by
 RS-EX-MBS2.realsil.com.cn ([fe80::d17c:2fd0:cf8e:635%9]) with mapi id
 15.02.2562.049; Tue, 22 Sep 2026 19:17:29 +0800
From: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
To: Frank Li <Frank.li@oss.nxp.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones
	<lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Vikash Bansal <vikash.bansal@nxp.com>, "Aman Kumar
 Pandey" <aman.kumarpandey@nxp.com>, Lakshay Piplani
	<lakshay.piplani@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "mfd@lists.linux.dev" <mfd@lists.linux.dev>,
	=?utf-8?B?546L54Kc?= <wei_wang@realsil.com.cn>
Subject: =?utf-8?B?5Zue5aSNOiBbUkZDIFBBVENIIDQvNF0gaTNjOiBodWI6IEFkZCBSZWFsdGVrIFJUUzQ5MHggSTNDIGh1YiBzdXBwb3J0?=
Thread-Topic: [RFC PATCH 4/4] i3c: hub: Add Realtek RTS490x I3C hub support
Thread-Index: AQHdSOfLaKpFKLXJIUuzQzqoL4gPULbY2e6AgAGbpWA=
Date: Tue, 22 Sep 2026 11:17:28 +0000
Message-ID: <1453c25fb1fd4db1a928bf83e72187f9@realsil.com.cn>
References: <20260920100501.4091351-1-zain_zhou@realsil.com.cn>
 <20260920100501.4091351-5-zain_zhou@realsil.com.cn>
 <arF6ifEpWAlO10B3@lizhi-Precision-Tower-5810>
In-Reply-To: <arF6ifEpWAlO10B3@lizhi-Precision-Tower-5810>
Accept-Language: en-US, zh-CN
Content-Language: zh-CN
x-originating-ip: [172.29.17.210]
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_121822_946107_5DD87275 
X-CRM114-Status: UNSURE (   9.40  )
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

On Mon, Sep 21, 2026 at 02:42:17PM -0400, Frank Li wrote:
> This register is the exactly same as P3H2X4X. Can you direct reuse
> p3h2x*'s driver.

Both P3H2x4x and RTS490x are based on the I3C Hub Common Architecture
Specification, so identical specification-defined registers are
expected.

However, the current P3H2x4x driver is device-specific rather than a
generic implementation of the specification. Do you mean refactoring
it into a common implementation for devices based on this
specification, while keeping the device-specific parts separate?

Best regards,
Zain
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
