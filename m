Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FDFBFD4F05
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Mar 2026 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hXAbM13BqyFNMomOKkjlj6v6aSBSQK+Zy4ljDDKmf40=; b=iUYbxPXxqPreU6
	gxOt6Lf/d3hx2y6lOVtnX5OJgEP5trpTk1mF3pqs9cuDJraaJQhGQPReqkxJ4N0BNEgggntHEM+If
	HmBg4Zi1g6hPbBVx1B6XVhdzwtQl5sORNkIv/VomERGE9uND6dMFEIenwAwlR053CP+tRXg0T9Wyb
	FgHwgRAzE6jOFg566NbdG2dBdd3VzSgFFAgDCKbdFPPkroC8mrIYhtKpgcoj4kpSjbXcRgOhUhEdw
	Lnp/0Q3ZqLU2a49E/gokJFZExpSgHf3kFqkyz8rW1n6i1nQ6yJy2JgI9U+4aQylZ1DUNgiRipgCoh
	DYpmXcgTiuNJz1NvVdhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00Hi-00000009vzP-3v2D;
	Tue, 10 Mar 2026 16:50:18 +0000
Received: from mail-swedencentralazon11013048.outbound.protection.outlook.com ([52.101.83.48] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w00Hg-00000009vz1-17A2
	for linux-i3c@lists.infradead.org;
	Tue, 10 Mar 2026 16:50:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ly8YoBZfYw+vB15wmh4rPPMlQTGn01CtD3lEpIY9dMPX8Dw5p4EPw+WN/XIcOQsR5BT/cDyREeGL0uvTSdOQuud+e+EOQpEwja0wUAoroqSGlLfcKv90Pk6qZ6gqjJLJPgcp/nWK+FUytEOmUWmLhtfE5mA9AHjz/MI8/QH1hpz4GGPcVcQslKSbG8f73Wk3tmKSrIUaO9P94fac7y0DvlLM8QcxKcB89WQF8FFTSnvOG6BglQ6EyJpviSrqqZ/CXdaSad2pchSgmWKn6xk3UbJ4zKXhE8VxEQzS8GSEBSCJiJQBMV222Bo+FvdZSXxh25emC5VTlBB6d1b4laq/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQq/yugrIY6ulPzVskJipwhd3Eoym4qKIzfX0ouGVaA=;
 b=SwL2oI/7c1qkxvXfjrv5NJ/iRH65c/2qhu1J2OYkl9KrF1/En6ubO0y4wta+iw8uxmbXmnq6YjHqL6fME6881BznyVxCt/ht58k3OvXcqOwpX31+5smQ35KRb6Z9C4q2FJglcJvhAc+4y5DMpfik4DKLbuyyOx5hyOCADxPdDjFjN1BJvMjyuxm1a7JysPfqsXRWfU6Ph8gf+mCl+H+I+YLtmHNwdPhaxkavCUhiVdWFAvF4GGJSL284ICGETpdXp3o6yv8jyzn8uon9Y6cAd1BFP98STQ6/XRxkvlBym527w8cS/LMMjhqSZy8X80RcRP5TMi/yYKsrztApxgalsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQq/yugrIY6ulPzVskJipwhd3Eoym4qKIzfX0ouGVaA=;
 b=MedJb5sxCox8iAku7stElvm/HLw7pY3VMfvcCVksx9vmI3xOc7mjXW/77BbjNxF53rbaScplD5JvrzqDfN0WBS6ZHqtfnhlw2l4WYq9F3Ebkw0VfQY02MDpdWXsuZJetUwUqtVNgsncxZhCVqEp79M4cz/Yu2b7jk3dHds4FvKPdSLQFCQhHs3zmqcCbgU6P2nN1rK90YPPfzELSeD6Si//JjUujBokHpoolWp7r6lb7vUuQ23zmXL0e1aoPJFXcKS34aNlCTUtBcv71JjqbNlJnJ4A18pY1j6my0ZSm+vR1145VQAhQw5bjGk/QbfFHtIu4ZgkikNBRKEUf+9Z+aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB7118.eurprd04.prod.outlook.com (2603:10a6:800:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 16:50:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9678.017; Tue, 10 Mar 2026
 16:50:10 +0000
Date: Tue, 10 Mar 2026 12:50:03 -0400
From: Frank Li <Frank.li@nxp.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, lgirdwood@gmail.com, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, aman.kumarpandey@nxp.com
Subject: Re: [PATCH v6 2/7] i3c: master: Add the APIs to support I3C hub
Message-ID: <abBLrXMPKutWjney@lizhi-Precision-Tower-5810>
References: <20260310065727.3759342-1-lakshay.piplani@nxp.com>
 <20260310065727.3759342-2-lakshay.piplani@nxp.com>
Content-Disposition: inline
In-Reply-To: <20260310065727.3759342-2-lakshay.piplani@nxp.com>
X-ClientProxiedBy: SA0PR11CA0030.namprd11.prod.outlook.com
 (2603:10b6:806:d3::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: f4203dcf-2024-41c0-a31e-08de7ec5179c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: usPF5k8vB2U0BCqa74bdrWS/8U2jSMj2iy/8M3vZCfDom2Kdyla0lyBlcfoMW6U5dzS74d9pegys3f7ZrVicNP7XHsEmgEoMmKj2OMA2/GfDk3tvtPK26ox9IKNeWKczCD2WEqJkm9/aPcHMhngdB23JSxCXnseomoPFghme54RXm74qAjBf2awQQL3zf/89RLDh2smyyn0B5CxeyWxEEpLmuIJK8sVsK/oCAqQ2zH+kR8OH3zKTuXk7uHvryeWdb3AOd0cElalmNzrN1+SAjtf4Gma9/nltTfImp+n7YxyDRMm6N4zGAZgUAW4co+bw0+5nKcjLOKmgdDSpKCM1PgglbOshvNrN5CBxQUF8RSuuV+ztgYqxeeCpB2WQI9uWp+zm5L2S83cs4yPlMEMN8L/HxS6MMAPxl6PGNZlSVxWVKopyC0kFEreV9tshB6hMSEfmReLqhpy7C6Hu2JK4ep7ZCHW+KR79ePsg2VOCIEZzzMqRagI63x5vU/RbDdiNHl7yCNFm4Dl2oJWKls34DkmCiIktennp3Ix8hqnqy2lBuTSk+UtKA0ZF+kx6sOII+kKIJrzlkIrMfhB072o8HAWfxalXklNitj36b+NEGlTfsI3D+fjeGgkJoaTusalnP7tc2Z9SDZ9lSmPDOw8OdDV6zzQqKOtVbbrnC25qSpYkPpOlp2wLRXN9sAp99CHprDXhTqER8ntf/9qdZlCf4dyF8VVAgMZsvFPMFCZTFo6atkbBkoJ56maezok8ttDlk+k4cn6r1oDIiFsE4b6OmMnQIx7zGLlt5dgKIgtcdMY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jnqhqlZodNo32r29FgEWVPTF1eB9A+r32PORqR7M/rhL0U8YwFffa1lWWo84?=
 =?us-ascii?Q?prMsRPir19V5xP6TsilWSSQsDzcXsu9Hp9/67obXG435hUmup8C+RTYDnrTw?=
 =?us-ascii?Q?NBsoaMff7RywA4GeX4fl5bgQmEHjUBdQSB2KyVG/vsBpTFz9C3lIxIMXyIY7?=
 =?us-ascii?Q?ddIsoeLyG+5CbzBJmL5lpNMBLBoItvOrxKyq9rfyTrCjcgTUUR7Vi+svSrwx?=
 =?us-ascii?Q?s6iJyadOOcM+F2pcMXILPj4frSV9kv9vPuN3m8t4bH9OXqCQOBSldlE7A4+t?=
 =?us-ascii?Q?0I8TXeS/z9zvPPxHK2Z/rem9W7Bk+iMI8SBYOkPc6M2HkRJrYnTVALjCimVB?=
 =?us-ascii?Q?R8H8RLwV23rtWFe7XqBeILk8ivQoEyEaMh14OL8LTS061SHM+VUoiXL59R9p?=
 =?us-ascii?Q?L2G5X9vk+TFtOfEc1gcMAiduIpL9lBL9vQkb15Vo4E6rT3yI5v8n0wa7qANQ?=
 =?us-ascii?Q?WkQe6mFfDH/Jj5FPJrnYZ7mrk/63YLDAEUhWKGKJkICbtLdUcmrgMosd/bgk?=
 =?us-ascii?Q?6PHG/ekGZUId4hcYoonDW884E+1Z18RlCHRrZR6lmtJEwf0BefcMVhot5PHG?=
 =?us-ascii?Q?SCjOQl/xGwcfEnQePV4occ0HhFasY6e9iSurVXgIQJ3yRZF4uk8DoBL9B6rr?=
 =?us-ascii?Q?8QF5K0q2dPrOPKyDmdOsn4eaqU0ckO2N37he65z8fkpxBNz6IO2hAZkR62YD?=
 =?us-ascii?Q?tu8JReZkXJ6A3XsTJfaX6Z/SRrwMwbrtCl2MVQ24DFb32BWiHYbA8/2dLzpB?=
 =?us-ascii?Q?u+t1zKPBkWuWNTpinKNz5kP1jlBGPRXPbBm5g9DspCYbxoAHWPymybyva5I+?=
 =?us-ascii?Q?kYIUWc2TPgx3M4yWI5SJEQvya8h7YLFU22KsTHc2wXv1e7hztAE7Pidw4EEQ?=
 =?us-ascii?Q?GjguJW/RuaTJ0FSzwV1V73G2KiL6/CtaYxot4ohoRLf73gSMvmSBp0X7pyro?=
 =?us-ascii?Q?rxcBYlAgO5ZNjjg7O3Ocuk7IwvEQG/3PA68lmd9R9R0KIshF8zdtrPBN5rA0?=
 =?us-ascii?Q?Be+k9aH2clmx0OCmH0cxxTuM1pB0CRYfTYk28UgCQ4a8RHLfta2ozu43iqyh?=
 =?us-ascii?Q?gvnaHmbkv7PFNVPOOMv/6hT7oCFTOCcC1HMehO7KYkrYSfFBQ36rrtbVWKmH?=
 =?us-ascii?Q?kR+u/+TzoLcKTpRFCQIzoAg42m7u5D9f5TFRjnebVett5aD4RTXp9pXRJpD1?=
 =?us-ascii?Q?rfQ0xiF2PS5rjqUZcAXLntlTvx5KSTrUsCWDH/S3DVB0OZyuFjcNXNRUbNzK?=
 =?us-ascii?Q?xlDS6FytlydPbyuC8mdUxSOs+rwixW/C1kzo7Bep+4b4WhgrTTIgrvLrkfjd?=
 =?us-ascii?Q?m/ibx7oG1V+dwrrdy0VH7NDU8/cKYo2DZs9cOsdvOzv+jD7PZoMqkhrh4I8+?=
 =?us-ascii?Q?s8IjafGjtNE5QiDUCrhrq2O/vZ235XMTGgKDySJ2nqyqoOYirb5eqqV95zrb?=
 =?us-ascii?Q?7Dt9K7Bb7fTQVzP/X2QI0Y/QYReFWmYdFhVXHMrRsspee7xBMTqtw4ZnoJTG?=
 =?us-ascii?Q?uN3m0WHUTGTjgM/J7J1E2PFS6eo9s4q4zG+kwvjYYTxoRU/SUuPKYqoaC0oV?=
 =?us-ascii?Q?66uXfr/z6OyOzitkv+sog68rb63CVbmq0LY+Mp9csCT9XxwhPZtW3JMDDURg?=
 =?us-ascii?Q?u0wR7X0MxHUW6upfu2IBSbxG8I3jqK4wVcdo9mvm26w/zh3haMyX/t9942yZ?=
 =?us-ascii?Q?wRDoY1GPG4BO8bC5dxwLJxQlIDb9RN0SJZt6r7Z4Km06zKh0sxwJIfX6Tsk2?=
 =?us-ascii?Q?zTZ6up1RIA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4203dcf-2024-41c0-a31e-08de7ec5179c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 16:50:10.5856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyToZ7JBHsG+7ETfpUXJGoSnO8KfhpGuHyzS7/yqyuqEQ7VHNRa+3qrA3GMS9xrJnbGk0y8En23HKeJCc1eURg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_095016_331346_C297DA38 
X-CRM114-Status: UNSURE (   6.86  )
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

On Tue, Mar 10, 2026 at 12:27:22PM +0530, Lakshay Piplani wrote:
> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> Add simple helpers to direct attach/detach I3C devices and
> two CCC helpers to check CCC support and send CCC commands.
>
> 1) i3c_master_direct_attach_i3c_dev()
> 2) i3c_master_direct_detach_i3c_dev()
> 3) i3c_master_send_ccc_cmd()
> 4) i3c_master_supports_ccc_cmd()

Add sentense:

"Prepare to support I3C hub."

Frank
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
