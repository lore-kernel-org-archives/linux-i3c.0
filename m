Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3621F36B9C
	for <linux-i3c@archiver.kernel.org>; Fri, 10 Apr 2026 07:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FROrvYwqiw3n3hoitZzFo2/qS7oJANH0qwATzJwsD8Q=; b=25VD00Ecvirgcx
	iNAa4WnjaW3UzGyHtKhY6DXeaFtj/jC/qXKqqPmt1kVbJmw1nu9jBbSeZplHvMlGpKgCtm5TfqMZv
	xhF7Pzp5z+aBALHDas3Owpze3+5hDqwLYUxTHv4L1ggjvt2mutjIzz9Ego9kE7NeFjA840X0OmiLd
	adBSO/n3Ww6ayIfWYh9d2WlNv0JXPQ9CoBBXbP9oDrBcfUnuW5D2lVQIZyzPBfGM9MVqol9deG+b+
	eph9Xbd7jzxEf0cQI8GwMafOicXnTuhVAdVXNAUmY+CD54nUcGv7F6vYqkSEKoDGyGQqslcBDU6jx
	di+nSrU22tCc/E2f9b3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5vP-0000000Bhvf-2g2n;
	Fri, 10 Apr 2026 07:05:07 +0000
Received: from mail-eastus2azlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c110::1] helo=BN1PR04CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB5vM-0000000BhvJ-3G68
	for linux-i3c@lists.infradead.org;
	Fri, 10 Apr 2026 07:05:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nra446FU1naGi9bonoaVki8cIPspQ6iOmRA9lLPGn5khq7OB5+HgXdGVXuVxjzUk2My4P7Ejfwsbue3E/UMnHHXicOtmNYll9zbV0I25v0h9ne7RioeMyHGn5C0ZvzJvQuZRc8TX4wUHa7McEe3NJF/pDU3GlDubSlPL0mIrssdja1K2uFYCA4bNuFBp9D5DaaD1OEc1gNAR+GDpPV1pk7MpF06Agiq/yzD+D9CTzxQPvTUlfA4a9FhkUI8Qf557YWcZtuciWWw94tyZxdXCwphxadmy4vfRQ1PtVMvcKaJ9i4m/jE5jxI4a2yydHbaKSJRG0ySHbPVlCCj6PUfEOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZur9PZL+ytM+xDu9JEP9K+wdC937JgPjwShbkJZrBs=;
 b=Sw2U6no+j8HwpZas8VNgjgkHiZ1y2O4YaBQuyjTQw+FWZT7J2LnGSPTcJSGj9k/XIgcth8u9W7dg1XiP19pBFTZTJUw93BaMcjexGz17Z/jYIBHZxkRIRzHlm5hr0MeOCm/Mx4YuYWbh3i3HXvtwgsjoAnV2yn4mzC2Dr8k7DDZbn1JXZAEvxy+z8gjLTtfbR3xMkraHf9+2jd/KbrLfp+aoLUAqpxGgpukyWDieIaQOCsms23K0B+RS5zDYZ8TtbgiV+GY1yi6VRZdOs3qPfixoqE49rfkYPnrhXjq4nrNdQgxS62iqKP+HV7rY1vLlR22P8UxANin06wRDWL+8oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZur9PZL+ytM+xDu9JEP9K+wdC937JgPjwShbkJZrBs=;
 b=p/ICwR9qy+km0gnAfn5/EZB2VExXqlvTXUf9EJRytYC/TFjmJ1JoMkaTZuts/gntA1cK0JweylyG/9+Srl2Bme88bQ0hNE0TLi3q4T+WU4TM1adEQuh3zBt6nhB6DVIsfLMeuREMhCjpNRKmu49vSYaCXpNhE+XaFPR++UyqqcImPrPGgYBzH23os6aJKccCBJAbWRB0r2FUBbnTZ6w00AISq0RYmz9u4UCfmo1Vcu2KP3oJ4muP+hbLgoZxJ9C2IXRbBPK2GLyR369AK9beyG+qL1xg8xY2OQPc8Zq8oWlqlJ0cl48vaOwXPKPot/1tS2twomXi1aUPYtzeNparag==
Received: from BN9PR03CA0097.namprd03.prod.outlook.com (2603:10b6:408:fd::12)
 by SJ2PR12MB9116.namprd12.prod.outlook.com (2603:10b6:a03:557::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.33; Fri, 10 Apr
 2026 07:04:55 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:fd:cafe::e0) by BN9PR03CA0097.outlook.office365.com
 (2603:10b6:408:fd::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.42 via Frontend Transport; Fri,
 10 Apr 2026 07:04:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 10 Apr 2026 07:04:54 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Apr
 2026 00:04:42 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 10 Apr 2026 00:04:42 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Apr 2026 00:04:36 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <krzk@kernel.org>
CC: <Frank.Li@nxp.com>, <acpica-devel@lists.linux.dev>,
	<akhilrajeev@nvidia.com>, <alexandre.belloni@bootlin.com>,
	<conor+dt@kernel.org>, <devicetree@vger.kernel.org>, <ebiggers@kernel.org>,
	<krzk+dt@kernel.org>, <lenb@kernel.org>, <linux-acpi@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux@roeck-us.net>,
	<miquel.raynal@bootlin.com>, <p.zabel@pengutronix.de>, <rafael@kernel.org>,
	<robert.moore@intel.com>, <robh@kernel.org>, <sakari.ailus@linux.intel.com>,
	<wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
Date: Fri, 10 Apr 2026 12:34:35 +0530
Message-ID: <20260410070435.42503-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <6fd4bb71-90c5-4fe2-a520-97167fba049f@kernel.org>
References: <6fd4bb71-90c5-4fe2-a520-97167fba049f@kernel.org>
MIME-Version: 1.0
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 40612132-ab95-40a5-cb2e-08de96cf77ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: ppG1gwN3F8NyKbxVOHnAY0Dj8TR3EgNRAb2dp8ht7MHUOQfEQtb3HDcGHLxxoaUBqa6phnctAtIZljTyaIdYoGHbfTnvOhYFR4KxZm2Du0/zLDGZhP4cGrLjskS4nawub3Z3YlODwzrWTLlewwQKG0HlddMW56KWWsYPrpW8oi0AH3o9ynTc8BmHjZElzsfHHkNQBDGvW6xJqL8DICdZPwgb/epcOQQaXf9yUobQ3UvfJeDWmsFTmie3dRL7qDJIn5oH8xiihM3bfe/hLA3Am/2jXg/U0X7B/Jxy8q23W0bMhVJKuitY7khA6rxC1RmElrjLdoRIM0Kpo/RN+IkaIbOWA5w7oCA2kNQcQaVgyRkN0Mels1ab0bYah2vN8ZGfJY6rOqT8joMlezzlWnCwANw4gT2GoTAVlMp1Kmy4H7Yz+sayuBl/6MiBZUBYGqUy2fEvStYmmzUYIzS8gzSLqfqQP0O8lIQcnsoQFpZ86GJIs7ug1lfoc+g0Enb3UYdyaIS6gzXd47AzKyd/C1YpK+8Dxpg+K9OpOPM+M3ZktUl0zHJdZ4V7K0sFf1kHYxJtb319EHltPdE0ZjPx/l0bVlW5Ve+ulLqI4oYRpRlYzzLMoalD0gkVOi83LZwLrLgF6854/26lSUFirDN/v9xUiaqjLSxucj6n/EskXOGJQz7SQ4CrUXQeULp614qNx/RD1+Dz1QdurL/p/Y3svyOgiZgNf0KU36+xTqio+fxwg1UIZ36T2WNiylxdHoYocsm3/MaYmk0Kap2HJIv5D/yeuA==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3YnalgMMQRatz5Zcj4Te9Op11EZ6trvIGsFQjBFTRTUgL1EctXke5AcsJavMEMpLQqMLKNF5GEMH1A/wquTCst3I1xyVCI1q0MWNXkeva+m27X6dVxcWYPbjylOgvO79DL+2ItqZ7YuFRNrBoFq/Kv0DMI5AmCTK6xP5mNdC0aFeA4mKpulJPo5eMMo+Wwo8uddjKRtTRtOdGg2JsPX9shFYYjAwXQ7jjDrm7TGWPbtYZYz546FkQViJKGImW758Om/Aa2m9XSDUP1xHCClY8ZqD+EKAljB+06t2jKiNFx/R/DQz+cX9B5AMchvcBhfRXVvrmevd85AbF4EXZzoU5q9BBMNyBHCbJx4Bs+8jGVh708agyH3q+lXEObwLG4VFqmpSdY9Bo++06xJ72rcFkIJsR8scmclCh1NXE3ZBTbyow4e7Eh0kI15RAWWUdzn7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 07:04:54.5690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40612132-ab95-40a5-cb2e-08de96cf77ec
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_000504_839975_31027FAC 
X-CRM114-Status: UNSURE (   6.18  )
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

On Fri, 10 Apr 2026 08:39:19 +0200, Krzysztof Kozlowski wrote:
> On 09/04/2026 12:57, Akhil R wrote:
>> Add I3C subsystem support, DesignWare I3C master controller, and
>> SPD5118 hwmon sensor as modules to the defconfig and therefore
>> enable the support for SPD5118 sensor on SOCAMM found in NVIDIA
>> Vera platforms.
> 
> git grep for "Vera" gave me zero results. Are you sure this is an
> upstream platform? Please point the DTS using this.

Vera is an ACPI based platform. Yes, it is an upstream platform.
SoC changes go under the name Tegra410.

Regards,
Akhil

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
